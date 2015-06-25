# -*- encoding: utf-8 -*-
# stub: rubygsm 0.42 ruby lib

Gem::Specification.new do |s|
  s.name = "rubygsm"
  s.version = "0.42"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Adam Mckaig"]
  s.date = "2013-10-05"
  s.email = "adam.mckaig@gmail.com"
  s.executables = ["gsm-modem-band", "sms"]
  s.files = ["bin/gsm-modem-band", "bin/sms"]
  s.homepage = "http://github.com/adammck/rubygsm"
  s.rubygems_version = "2.4.5"
  s.summary = "Send and receive SMS with a GSM modem"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<serialport>, [">= 1.1.0"])
    else
      s.add_dependency(%q<serialport>, [">= 1.1.0"])
    end
  else
    s.add_dependency(%q<serialport>, [">= 1.1.0"])
  end
end
