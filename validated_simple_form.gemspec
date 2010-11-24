# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validated_simple_form/version"

Gem::Specification.new do |s|
  s.name        = "validated_simple_form"
  s.version     = ValidatedSimpleForm::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TODO: Write your name"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = "http://rubygems.org/gems/validated_simple_form"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "validated_simple_form"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "actionpack",  "~> 3.0.3"
  s.add_dependency "activemodel", "~> 3.0.3"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.0.0"
end
