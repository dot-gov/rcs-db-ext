require_relative '../rcs-common/lib/rcs-common/deploy'

desc "Deploy"
task :deploy do
  user      = 'Administrator'
  address   = '192.168.100.100'
  deploy    = RCS::Deploy.new(user: user, address: address)
  target    = deploy.target
  localhost = deploy.me

  if localhost.pending_changes?
    exit unless localhost.ask('You have pending changes, continue?')
  end

  %[Ruby Java Python].each do |name|
    target.mirror("#{me.path}/#{name}/", "rcs/rcs-db-ext/#{name}")
    target.run("icacls \"C:\\RCS\\rcs-db-ext\\#{name}\" /grant Users:F Administrators:F SYSTEM:F /T", trap: true)
  end
end
