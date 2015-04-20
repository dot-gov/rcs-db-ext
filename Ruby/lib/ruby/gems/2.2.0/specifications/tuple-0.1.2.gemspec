# -*- encoding: utf-8 -*-
# stub: tuple 0.1.2 ruby lib
# stub: ext/tuple/extconf.rb

Gem::Specification.new do |s|
  s.name = "tuple"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server." } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Justin Balthrop", "Ash Moran", "topac"]
  s.date = "2015-04-17"
  s.description = "Fast, binary-sortable serialization for arrays of simple Ruby types"
  s.email = "code@justinbalthrop.com"
  s.extensions = ["ext/tuple/extconf.rb"]
  s.files = ["ext/tuple/extconf.rb"]
  s.homepage = "http://github.com/ninjudd/tuple"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Tuple serialization functions"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.8.3"])
      s.add_development_dependency(%q<test-unit>, ["~> 2.0"])
    else
      s.add_dependency(%q<rake-compiler>, ["~> 0.8.3"])
      s.add_dependency(%q<test-unit>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<rake-compiler>, ["~> 0.8.3"])
    s.add_dependency(%q<test-unit>, ["~> 2.0"])
  end
end
