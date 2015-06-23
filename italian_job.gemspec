# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "italian_job/version"

Gem::Specification.new do |s|
    s.name        = "italian_job"
    s.version     = ItalianJob::VERSION
    s.platform    = Gem::Platform::RUBY
    s.authors     = ["Luca Pette"]
    s.email       = ["lucapette@gmail.com"]
    s.homepage    = "http://github.com/lucapette/italian_job"
    s.summary     = %q{ActiveRecord Validators for dealing with typical italian business problems}
    s.description = %q{If you want to validate Italian tax Code (Codice Fiscale) or Italian VAT (Partita IVA) then you need this gem.}

    s.rubyforge_project = "italian_job"

    s.add_development_dependency 'sqlite3'
    s.add_dependency "rails", ">= 3.0.0"
    s.add_development_dependency "rspec-rails", ">= 2.5.0"

    s.files         = `git ls-files`.split("\n")
    s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ["lib"]
end
