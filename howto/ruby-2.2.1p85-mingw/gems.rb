# rake-compiler + bundler

begin
  require "rake-compiler"
rescue LoadError => error
  system "gem install bundler"
  system "gem install rake-compiler"
end

# ffi

system "ruby patch-ffi-1.9.8.rb"

# tuple

system "ruby tuple-0.1.2.rb"

# minitar

system "ruby minitar-0.5.6.rb"

# bdb

devkit_path = "C:\\DevKit"
sevenzip = "C:\\Program Files\\7-Zip\\7z.exe"

raise("Unable to find 7z executable") unless File.exists?(sevenzip)

system "\"#{sevenzip}\" x berkeley_db_5.1.29_include.zip -y -o\"#{devkit_path}\""
system "gem install bdb-0.2.6.5.gem"

# bcrypt

system "ruby bcrypt-3.1.10.rb"
