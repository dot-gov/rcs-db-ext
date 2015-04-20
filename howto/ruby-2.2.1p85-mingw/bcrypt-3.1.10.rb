require "tmpdir"

def test_bcrypt
  require "bcrypt"
  puts "bcrypt is ok!"
end

def manually_install_bcrypt
  repo_url = "https://github.com/codahale/bcrypt-ruby"
  last_valid_commit = "1f9184a8df2b90fa02d01a32a364eefc9072e1b9"

  tmpdir = Dir.tmpdir
  drive_letter = tmpdir[0..1]
  repo_dir = "#{tmpdir}\\bcrypt-ruby"

  FileUtils.rm_rf(repo_dir)

  system "#{drive_letter} && cd #{tmpdir} && git clone #{repo_url}"

  system "#{drive_letter} && cd #{repo_dir} && git checkout #{last_valid_commit}"

  system("#{drive_letter} && cd #{repo_dir} && bundle && rake gem && gem install pkg\\bcrypt-3.1.10.gem") || raise("installation failed")

  puts "done!"
end

begin
  test_bcrypt
rescue LoadError => error
  manually_install_bcrypt
end
