# -*- encoding: utf-8 -*-
# stub: reek 4.7.2 ruby lib

Gem::Specification.new do |s|
  s.name = "reek".freeze
  s.version = "4.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kevin Rutherford".freeze, "Timo Roessner".freeze, "Matijs van Zuijlen".freeze, "Piotr Szotkowski".freeze]
  s.date = "2017-07-24"
  s.description = "Reek is a tool that examines Ruby classes, modules and methods and reports any code smells it finds.".freeze
  s.email = ["timo.roessner@googlemail.com".freeze]
  s.executables = ["code_climate_reek".freeze, "reek".freeze]
  s.extra_rdoc_files = ["CHANGELOG.md".freeze, "License.txt".freeze]
  s.files = ["CHANGELOG.md".freeze, "License.txt".freeze, "bin/code_climate_reek".freeze, "bin/reek".freeze]
  s.homepage = "https://github.com/troessner/reek/wiki".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze, "-x".freeze, "assets/|bin/|config/|features/|spec/|tasks/".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "2.6.13".freeze
  s.summary = "Code smell detector for Ruby".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<codeclimate-engine-rb>.freeze, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<parser>.freeze, ["< 2.5", ">= 2.4.0.0"])
      s.add_runtime_dependency(%q<rainbow>.freeze, ["~> 2.0"])
    else
      s.add_dependency(%q<codeclimate-engine-rb>.freeze, ["~> 0.4.0"])
      s.add_dependency(%q<parser>.freeze, ["< 2.5", ">= 2.4.0.0"])
      s.add_dependency(%q<rainbow>.freeze, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<codeclimate-engine-rb>.freeze, ["~> 0.4.0"])
    s.add_dependency(%q<parser>.freeze, ["< 2.5", ">= 2.4.0.0"])
    s.add_dependency(%q<rainbow>.freeze, ["~> 2.0"])
  end
end
