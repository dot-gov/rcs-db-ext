require "tmpdir"

def test_tuple
  require "tuple"
  puts "tuple is ok!"
end

def manually_install_tuple
  repo_url = "https://github.com/topac/tuple"
  last_valid_commit = "33f1110ef9a6a7b87b076b2d47f58e2847c46e80"

  tmpdir = Dir.tmpdir
  drive_letter = tmpdir[0..1]
  repo_dir = "#{tmpdir}\\tuple"

  FileUtils.rm_rf(repo_dir)

  system "#{drive_letter} && cd #{tmpdir} && git clone #{repo_url}"

  system "#{drive_letter} && cd #{repo_dir} && git checkout #{last_valid_commit}"

  system("#{drive_letter} && cd #{repo_dir} && rake compile && gem build tuple.gemspec && gem install tuple-0.1.2.gem") || raise("installation failed")

  puts "done!"
end

begin
  test_tuple
rescue LoadError => error
  manually_install_tuple
end
