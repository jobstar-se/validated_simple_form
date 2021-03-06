# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validated_simple_form/version"

Gem::Specification.new do |s|
  s.name        = "validated_simple_form"
  s.version     = ValidatedSimpleForm::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Write your name"]
  s.email       = ["Write your email address"]
  s.homepage    = "http://rubygems.org/gems/validated_simple_form"
  s.summary     = %q{Write a gem summary}
  s.description = %q{rite a gem description}

  s.rubyforge_project = "validated_simple_form"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "actionpack",  ">= 3.0.1"
  s.add_dependency "activemodel", ">= 3.0.1"
  s.add_dependency "simple_form"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", ">= 2.2.0"
end
