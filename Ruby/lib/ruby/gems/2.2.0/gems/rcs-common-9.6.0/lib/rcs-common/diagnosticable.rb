require 'open3'
require 'sys/filesystem'
require 'rcs-common/fixnum'

module RCS
  module Diagnosticable
    def execution_directory
      File.expand_path(Dir.pwd)
    end

    def log_path
      File.expand_path("./log", execution_directory)
    end

    def grouped_logs(glob: "#{log_path}/*", deepness: 2)
      groups = Hash.new { |h, k| h[k] = [] }
      regexp = /(rcs\-.+)\_\d{4}-\d{2}-\d{2}\.log|(mongo..log)/

      Dir[glob].each do |path|
        filename = File.basename(path)
        group_name = filename.scan(regexp).flatten.compact.first
        groups[group_name] << path if group_name
      end

      groups.keys.each do |group_name|
        groups[group_name].sort! { |p1, p2| File.mtime(p2).to_i <=> File.mtime(p1).to_i }
        groups[group_name] = groups[group_name][0..deepness - 1]
      end

      groups
    end

    def pretty_print(hash, out = $stdout)
      string = JSON.pretty_generate(hash)
      string = hide_addresses(string)
      out.write(string)
      out.write("\n")
    end

    def change_trace_level(level)
      trace_yaml = "#{execution_directory}/config/trace.yaml"
      raise "Unable to find file #{trace_yaml}" unless File.exists?(trace_yaml)
      content = File.read(trace_yaml)
      content.gsub!(/(name\s*:\s*logfile\n\s*level\s*:\s*)[A-Z]+/, '\1'+level.to_s.upcase)
      File.open(trace_yaml, "wb") { |f| f.write(content) }
    end

    def get_version_info
      version = File.read("#{execution_directory}/config/VERSION")
      build = File.read("#{execution_directory}/config/VERSION_BUILD")
      return version, build
    end

    def relevant_logs
      list = grouped_logs.values + grouped_logs(glob: "#{log_path}/err/*", deepness: 7).values
      list.flatten!
      list
    end

    MAX_LOG_SIZE = 25_000_000

    def huge_log?(path)
      File.size(path) > MAX_LOG_SIZE
    end

    def read_log_file(path)
      if huge_log?(path)
        file = File.open(path, "rb")
        file.seek(-1 * MAX_LOG_SIZE, IO::SEEK_END)
        content = "#{'*'*40}\nFile too big. The following are the last #{MAX_LOG_SIZE} bytes\n#{'*'*40}\n\n".force_encoding("BINARY")
        content << file.read
        file.close

        return content
      else
        return File.read(path)
      end
    end

    def windows?
      RbConfig::CONFIG['host_os'] =~ /mingw/
    end

    def os_lang
      return unless windows?
      result = `reg query \"HKLM\\system\\controlset001\\control\\nls\\language\" /v Installlanguage`
      result.scan(/REG_SZ\s*(.{4})/).flatten.first
    end

    def command_output(name)
      cmd = (name =~ /rcs\-/) ? "ruby #{execution_directory}/bin/#{name}" : name
      stdout_and_stderr_str, status = Open3.capture2e(cmd)
      "Output of command #{name}\n#{stdout_and_stderr_str}\n\n"
    end

    def config_files
      paths = []
      %w[VERSION VERSION_BUILD certs/*.crt certs/*.pem certs/*.key *.yaml *.lic *.crt *.pem gapi task_journal].each do |glob|
        paths += Dir["#{execution_directory}/config/#{glob}"]
      end
      paths.flatten!
      paths.uniq!
      paths
    end

    def machine_info
      hash = {}
      keys = %w[build_os build_vendor build_cpu build RUBY_VERSION_NAME]
      hash['rbconfig'] = RbConfig::CONFIG.reject { |key| !keys.include?(key) }
      hash['os_lang'] = os_lang
      hash['gem_list'] = `gem list`.split("\n")
      hash['ENV'] = ENV.reject { |key| !%w[RUBY_VERSION PWD].include?(key) }

      fs = Sys::Filesystem.stat(windows? ? "#{Dir.pwd[0]+":\\"}" : "/")

      hash['filesystem'] = {
        'path' => fs.path,
        'size' => (fs.blocks * fs.block_size).to_s_bytes,
        'free' => (fs.blocks_free * fs.block_size).to_s_bytes,
      }
      hash
    end

    # Get the state (running, stopped, etc.) and the configuration information
    # of all the Windows services that start with "RCS"
    def services_state
      states = ""
      config = ""

      `sc query state= all`.split("SERVICE_NAME:").each do |info|
        name = info.scan(/\s*(.+)\n/).flatten.first

        if name =~ /^rcs/i
          state = info.scan(/STATE\s+:\s+\d+\s*(.+)\s*/).flatten.first
          states << "#{name}: #{state}\n"
          config << `sc qc #{name}`.scan(/SERVICE_NAME:\s*(.*)/m).flatten.last.to_s
        end
      end

      return "#{states}\n#{config}"
    end

    def hide_addresses(string)
      if $options.respond_to?(:[]) and $options[:hide_addresses]
        mask = "###.###.###.###"
        string.gsub!(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/, mask)
        string.gsub!(/([a-zA-Z0-9\-\.]+)\:(4444|443|80|2701\d)/, mask+':\2')
      end

      string
    end
  end
end
