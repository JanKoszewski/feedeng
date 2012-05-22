# -*- encoding: utf-8 -*-
require File.expand_path('../lib/feedeng/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jan Koszewski"]
  gem.email         = ["jan.koszewski@livingsocial.com"]
  gem.description   = %q{Client gem for the Feedeng.in service}
  gem.summary       = %q{Client gem for the Feedeng.in service}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "feedeng"
  gem.require_paths = ["lib"]
  gem.version       = Feedeng::VERSION

  gem.add_runtime_dependency 'faraday'
  gem.add_development_dependency 'rspec'
end
