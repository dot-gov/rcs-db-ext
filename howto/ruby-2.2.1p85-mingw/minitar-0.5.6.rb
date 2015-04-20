require "tmpdir"

def test_minitar
  require 'archive/tar/minitar'
  puts "minitar is ok!"
end

def manually_install_minitar
  repo_url = "https://github.com/topac/minitar"
  last_valid_commit = "cc093da8b4db624ac83e52d313c619474a91bd16"

  tmpdir = Dir.tmpdir
  drive_letter = tmpdir[0..1]
  repo_dir = "#{tmpdir}\\minitar"

  FileUtils.rm_rf(repo_dir)

  system "#{drive_letter} && cd #{tmpdir} && git clone #{repo_url}"

  system "#{drive_letter} && cd #{repo_dir} && git checkout #{last_valid_commit}"

  system("#{drive_letter} && cd #{repo_dir} && gem build minitar.gemspec && gem install minitar-0.5.6.gem") || raise("installation failed")

  puts "done!"
end

begin
  test_minitar
rescue LoadError => error
  manually_install_minitar
end
