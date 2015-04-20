# -*- encoding: utf-8 -*-
# stub: sbdb 0.0.12.2 ruby lib

Gem::Specification.new do |s|
  s.name = "sbdb"
  s.version = "0.0.12.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Denis Knauf"]
  s.date = "2011-08-25"
  s.description = "Simple Ruby Berkeley DB wrapper library for bdb."
  s.email = "Denis.Knauf@gmail.com"
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "http://github.com/ruby-bdb/sbdb"
  s.rubygems_version = "2.4.5"
  s.summary = "Simple Ruby Berkeley DB"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bdb>, [">= 0.2.6.5"])
      s.add_runtime_dependency(%q<ref>, [">= 0"])
    else
      s.add_dependency(%q<bdb>, [">= 0.2.6.5"])
      s.add_dependency(%q<ref>, [">= 0"])
    end
  else
    s.add_dependency(%q<bdb>, [">= 0.2.6.5"])
    s.add_dependency(%q<ref>, [">= 0"])
  end
end
