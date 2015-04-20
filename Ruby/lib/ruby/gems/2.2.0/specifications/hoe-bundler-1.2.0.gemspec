# -*- encoding: utf-8 -*-
# stub: hoe-bundler 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hoe-bundler"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mike Dalessio"]
  s.date = "2012-09-26"
  s.description = "Generate a Gemfile based on a Hoe spec's declared dependencies."
  s.email = ["mike.dalessio@gmail.com"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  s.files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  s.homepage = "http://github.com/flavorjones/hoe-bundler"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.rubyforge_project = "hoe-bundler"
  s.rubygems_version = "2.4.5"
  s.summary = "Generate a Gemfile based on a Hoe spec's declared dependencies."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hoe>, [">= 2.2.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<hoe>, [">= 2.2.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.2.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
