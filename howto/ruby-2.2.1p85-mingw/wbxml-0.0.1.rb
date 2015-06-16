require "tmpdir"

def test
  require 'wbxml'

xml = <<END
<?xml version="1.0"?>
<!DOCTYPE si PUBLIC "-//WAPFORUM//DTD SI 1.0//EN" "http://www.wapforum.org/DTD/si.dtd">
<si>
  <indication href="http://wap.yahoo.com">
    m-Qube Msg
  </indication>
</si>
END

  w = WBXML.xml_to_wbxml(xml).force_encoding("BINARY")
  expected = "\003\005j\000E\306\f\003wap.yahoo.com\000\001\003m-Qube Msg\000\001\001".force_encoding("BINARY")

  raise("generated wbxml and expected differs") if expected != w

  return true
rescue LoadError, Exception => ex
  puts "installation worked but test failed: #{ex.message}"
end

def extract_libexpat_dev
  devkit_path = "C:\\DevKit"
  sevenzip = "C:\\Program Files\\7-Zip\\7z.exe"

  raise("Unable to find 7z executable") unless File.exists?(sevenzip)

  system("\"#{sevenzip}\" x libexpat-2.0.1-1-mingw32-dev.zip -y -o\"#{devkit_path}\\mingw\\i686-w64-mingw32\"") or raise("extract failed")
end

def manually_install_wbxml
  system "gem uninstall wbxml --force"

  repo_url = "https://github.com/topac/ruby-wbxml-bundled"

  tmpdir = Dir.tmpdir
  drive_letter = tmpdir[0..1]
  repo_dir = "#{tmpdir}\\ruby-wbxml-bundled"

  FileUtils.rm_rf(repo_dir)

  system "#{drive_letter} && cd #{tmpdir} && git clone #{repo_url}"

  system("#{drive_letter} && cd #{repo_dir} && gem build wbxml-0.0.1.gemspec && gem install wbxml-0.0.1.gem") || raise("installation failed")

  system("copy C:\\DevKit\\mingw\\bin\\libexpat*.dll C:\\RCS\\DB\\bin")

  puts "done!"
end

extract_libexpat_dev

manually_install_wbxml

test
