# -*- encoding: utf-8 -*-
# stub: lrucache 0.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "lrucache"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chris Johnson"]
  s.date = "2012-11-28"
  s.description = "A simple LRU-cache based on a hash and priority queue"
  s.email = ["chris@kindkid.com"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.rubyforge_project = "lrucache"
  s.rubygems_version = "2.4.5"
  s.summary = "A simple LRU-cache based on a hash and priority queue"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<PriorityQueue>, ["~> 0.1.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.12.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.7.1"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9.2"])
      s.add_development_dependency(%q<guard>, ["~> 1.5.4"])
      s.add_development_dependency(%q<guard-bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 2.2.1"])
      s.add_development_dependency(%q<timecop>, ["~> 0.5.3"])
    else
      s.add_dependency(%q<PriorityQueue>, ["~> 0.1.2"])
      s.add_dependency(%q<rspec>, ["~> 2.12.0"])
      s.add_dependency(%q<simplecov>, ["~> 0.7.1"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9.2"])
      s.add_dependency(%q<guard>, ["~> 1.5.4"])
      s.add_dependency(%q<guard-bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 2.2.1"])
      s.add_dependency(%q<timecop>, ["~> 0.5.3"])
    end
  else
    s.add_dependency(%q<PriorityQueue>, ["~> 0.1.2"])
    s.add_dependency(%q<rspec>, ["~> 2.12.0"])
    s.add_dependency(%q<simplecov>, ["~> 0.7.1"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9.2"])
    s.add_dependency(%q<guard>, ["~> 1.5.4"])
    s.add_dependency(%q<guard-bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 2.2.1"])
    s.add_dependency(%q<timecop>, ["~> 0.5.3"])
  end
end
