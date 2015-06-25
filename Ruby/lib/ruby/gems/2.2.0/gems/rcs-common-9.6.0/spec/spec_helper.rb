require 'bundler'
require 'rspec'
require 'pry'

$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'rcs-common'
require 'rcs-common/mongoid'

RSpec.configure do |config|

  config.color = true

  config.before(:all) do
    ENV['MONGOID_ENV'] = 'spec'

    root_session = Moped::Session.new(["127.0.0.1:27017"])
    root_session.use("admin")
    root_session.login("root", "root")

    options = YAML.load_file File.expand_path('../mongoid.yaml', __FILE__)

    options["spec"]["sessions"].each do |name, info|
      user, pass = info["username"], info["password"]
      root_session.use(info["database"])
      root_session.command(dropAllUsersFromDatabase: 1)
      root_session.command(dropDatabase: 1)
      root_session.command(createUser: user, pwd: pass, roles:[{role:"root", db: "admin"}])
    end

    root_session.disconnect

    Mongoid.load! File.expand_path('../mongoid.yaml', __FILE__), :spec
  end

  config.before(:each) do
    Mongoid.purge!
  end
end
