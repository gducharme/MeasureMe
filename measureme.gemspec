# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{measureme}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Geoffrey Ducharme"]
  s.date = %q{2010-07-31}
  s.default_executable = %q{measureme}
  s.description = %q{Measure the amount of code created in a day}
  s.email = %q{geoffrey.ducharme@gmail.com}
  s.executables = ["measureme"]
  s.extra_rdoc_files = ["README.rdoc", "bin/measureme", "lib/exp.rb", "lib/measureme.rb"]
  s.files = ["README.rdoc", "Rakefile", "bin/measureme", "lib/exp.rb", "lib/measureme.rb", "Manifest", "measureme.gemspec"]
  s.homepage = %q{http://github.com/gducharme/measureme}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Measureme", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{measureme}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Measure the amount of code created in a day}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
