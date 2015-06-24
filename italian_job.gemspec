# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "italian_job/version"

Gem::Specification.new do |s|
  s.name        = "italian_job"
  s.version     = ItalianJob::VERSION
  s.authors     = ["Luca Pette", "Alessandro Lepore"]
  s.email       = ["a.lepore@freegoweb.it"]
  s.summary     = %q{ActiveRecord Validators for dealing with typical italian business problems}
  s.description = %q{If you want to validate Italian tax Code (Codice Fiscale) or Italian VAT (Partita IVA) then you need this gem.}
  s.homepage    = "https://github.com/freego/italian_job"
  s.license     = "WTFPL"

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.require_paths = ["lib"]

  s.add_dependency "railties", ">= 3.1"
  s.add_dependency "activemodel", ">= 3.0.0"

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
