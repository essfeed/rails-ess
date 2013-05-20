# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-ess/version'

Gem::Specification.new do |gem|
  gem.name          = "rails-ess"
  gem.version       = ESS::Rails::VERSION
  gem.authors       = ["Marjan Povolni"]
  gem.email         = ["marian.povolny@gmail.com"]
  gem.description   = %q{This gem extends Rails with the support for ESS feed generation using Builder like sintax.}
  gem.summary       = %q{Rails extensions for ESS XML Feeds}
  gem.homepage      = "https://github.com/essfeed/rails-ess"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "ess", "0.9.0"
  gem.add_runtime_dependency "rails"
end
