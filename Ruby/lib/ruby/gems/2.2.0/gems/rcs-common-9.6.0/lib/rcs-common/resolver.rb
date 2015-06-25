require 'resolv'
require 'timeout'
require 'socket'

module RCS
  module Resolver
    def resolved_dns_cache
      @@dns_cache ||= {}
    end

    def local_ipv4_addresses
      @local_ipv4_addresses ||= begin
        list = ["127.0.0.1"]

        Socket.ip_address_list.each do |addr|
          list << addr.ip_address if addr.ipv4?
        end

        list.uniq!
        list
      end
    end

    def resolve_to_localhost?(name, options = {})
      if name == 'localhost' or name == '127.0.0.1' or name == Socket.gethostname or local_ipv4_addresses.include?(name)
        return true
      else
        address = resolve_dns(name, options) rescue nil
        return address == '127.0.0.1'
      end
    end

    def resolve_dns(dns, use_cache: false)
      if use_cache and resolved_dns_cache[dns]
        return resolved_dns_cache[dns]
      end

      ip = nil

      Timeout::timeout(8) do
        ip = Resolv.getaddress(dns).to_s rescue nil
      end

      if ip.nil? and defined?(Win32)
        Timeout::timeout(10) do
          info = Win32::Resolv.get_resolv_info
          resolver = Resolv::DNS.new(nameserver: info[1], search: info[0])
          ip = resolver.getaddress(dns).to_s rescue nil
        end
      end

      raise("Cannot resolve DNS #{dns.inspect}: unknown host") unless ip

      resolved_dns_cache[dns] = ip

      return ip
    rescue Timeout::Error
      raise("Cannot resolve DNS #{dns.inspect}: timeout")
    rescue Exception => ex
      raise("Cannot resolve DNS #{dns.inspect}: #{ex.message}")
    end
  end
end
