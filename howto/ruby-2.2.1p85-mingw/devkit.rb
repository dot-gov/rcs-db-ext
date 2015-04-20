require "fileutils"
require "open-uri"
require "digest/md5"
require "tmpdir"
require 'optparse'

devkit_path = "C:\\DevKit"
skip_recipes = false
devkit_sfx_path = false
devkit_mingw_path = "#{devkit_path}\\mingw\\i686-w64-mingw32" # Because we are using 32bit ruby
devkit_url = "http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe"
sevenzip = "C:\\Program Files\\7-Zip\\7z.exe"

OptionParser.new do |parser|
  parser.on("--no-recipes", "Skip installing recipes") do
    skip_recipes = true
  end

  parser.on("--7z-path PATH", "7z executable path") do |path|
    sevenzip = path
  end

  parser.on("--devkit-sfx PATH", "DevKit sfx path (skip downloading it when provided)") do |path|
    devkit_sfx_path = path
  end
end.parse!

raise("Unable to find 7z executable") unless File.exists?(sevenzip)

# Download then DevKit
unless devkit_sfx_path
  puts "Downloading devkit..."
  tmpfile = open(devkit_url)
  devkit_sfx_path = "#{tmpfile.path}.exe"
  File.open(devkit_sfx_path, "wb") { |f| f.write(tmpfile.read) }
  FileUtils.rm_f(tmpfile.path)
end

# Remove current DevKit
puts "Remove previous devkit..."
FileUtils.rm_rf(devkit_path)

# Extract the DevKit
puts "Extracting devkit..."
raise("Invalid MD5") if Digest::MD5.file(devkit_sfx_path).hexdigest != "9383f12958aafc425923e322460a84de"
system("\"#{devkit_sfx_path}\" -y -o\"#{devkit_path}\"")

unless skip_recipes
  # Extract these files into the DevKit folder
  # @see https://groups.google.com/forum/#!msg/rubyinstaller/4ulo3o1bQOM/2F1f24XWWaQJ
  # @see https://github.com/oneclick/knapsack-recipes
  {
    # "http://packages.openknapsack.org/libffi/libffi-3.0.10-x86-windows.tar.lzma"    => "eb7d567287639d6f1f38b5725ad2a0a0",
    "http://packages.openknapsack.org/zlib/zlib-1.2.6-x86-windows.tar.lzma"         => "86e7371b6e256c7be4c990c86cd16ae6",
    "http://packages.openknapsack.org/openssl/openssl-1.0.0g-x86-windows.tar.lzma"  => "a3b1c963165670f08e8fe704e14c91ed",
    "knapsack-sqlite-3.7.15.2.zip" => nil
  }.each do |package_url, package_md5|

    raise("Invalid DevKit path - #{devkit_mingw_path}") unless Dir.exists?(devkit_path)

    if package_url !~ /^http/i
      command = "\"#{sevenzip}\" x \"#{package_url}\" -o\"#{devkit_mingw_path}\" -y"
      system(command)
      next
    end

    name = File.basename(package_url)
    path = "#{Dir.tmpdir}\\#{name}"
    File.open(path, "wb") { |f| f.write(open(package_url).read) }

    raise("Invalid MD5 - #{package_url}") if Digest::MD5.file(path).hexdigest != package_md5

    command = "\"#{sevenzip}\" x \"#{path}\" -o\"#{devkit_mingw_path}\" -y"
    system(command)

    name.gsub!(".lzma", "")
    command = "\"#{sevenzip}\" x \"#{devkit_mingw_path}\\#{name}\" -o\"#{devkit_mingw_path}\" -y"

    system(command)

    FileUtils.rm_f("#{devkit_mingw_path}\\#{path}")
    FileUtils.rm_f(path)
  end
end

# Configure and install DevKit
system("cd \"#{devkit_path}\" && ruby dk.rb init")
system("cd \"#{devkit_path}\" && ruby dk.rb review")
system("cd \"#{devkit_path}\" && ruby dk.rb --force install")
system("cd \"#{devkit_path}\" && devkitvars.bat")

puts "Intallation completed!"
