require 'open3'

def verbose?
  ARGV.include?("--trace") or ARGV.include?("-v") or ARGV.include?("--verbose")
end

def safe_system(cmd, message = nil)
  puts(cmd)
  stdout_and_stderr_str, status = Open3.capture2e(cmd)
  puts(stdout_and_stderr_str.read) if verbose?
  raise("Command failed. Use --trace option to get more details.") unless status.success?
end

# rake-compiler + bundler

begin
  require "rake-compiler"
rescue LoadError => error
  safe_system "gem install bundler"
  safe_system "gem install rake-compiler"
end

# tuple

safe_system "ruby tuple-0.1.2.rb"

# minitar

safe_system "ruby minitar-0.5.6.rb"

# bdb

devkit_path = "C:\\DevKit"
sevenzip = "C:\\Program Files\\7-Zip\\7z.exe"

raise("Unable to find 7z executable") unless File.exists?(sevenzip)

safe_system "\"#{sevenzip}\" x berkeley_db_5.1.29_include.zip -y -o\"#{devkit_path}\""
safe_system "gem install bdb-0.2.6.5.gem"


# Install all the other gems

safe_system "C: && cd C:\\RCS\\rcs-db && bundle"
safe_system "C: && cd C:\\RCS\\rcs-collector && bundle"

# sqlite3

safe_system "gem uninstall sqlite3 --force"
safe_system "gem install sqlite3 --platform=ruby"

# ffi

safe_system "ruby patch-ffi-1.9.8.rb"

# bcrypt

safe_system "ruby bcrypt-3.1.10.rb"

# wbxml

safe_system "ruby wbxml-0.0.1.rb"

# clean

safe_system "gem clean"
