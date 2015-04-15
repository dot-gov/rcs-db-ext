require "open-uri"
require "openssl"

def test_ffi
  require "ffi"
  puts "ffi is ok!"
end

def fix_ffi_198
  ffi_path = $:.select { |path| path =~ /ffi/ }.first
  file_to_patch = "#{ffi_path}/ffi.rb"

  if ffi_path and ffi_path =~ /1.9.8/ and File.exists?(file_to_patch)
    url = "https://raw.githubusercontent.com/ffi/ffi/4168ef3dbd56a7b52978efb2ff7d0dc448f8f8f1/lib/ffi.rb"
    tmpfile = open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
    File.open(file_to_patch, "wb") { |file| file.write(tmpfile.read) }
    puts "ffi patched!"
  else
    puts "ffi is not installed or ffi vesion is not 1.9.8"
  end
end

begin
  test_ffi
rescue LoadError => error
  # puts error.message
  fix_ffi_198
end
