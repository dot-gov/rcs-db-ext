def safe_system(cmd)
  system(cmd) || raise("command failed")
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

# bcrypt

safe_system "ruby bcrypt-3.1.10.rb"


# Install all the other gems

safe_system "cd C:\\RCS\\rcs-db && bundle"
safe_system "cd C:\\RCS\\rcs-collector && bundle"

# ffi

safe_system "ruby patch-ffi-1.9.8.rb"

# clean

safe_system "gem clean"
