# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cssdoc/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryo Nakamura"]
  gem.email         = ["r7kamura@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cssdoc"
  gem.require_paths = ["lib"]
  gem.version       = Cssdoc::VERSION

  gem.add_dependency "sinatra"
  gem.add_dependency "sinatra_more"
  gem.add_dependency "nokogiri"
  gem.add_dependency "redcarpet"
  gem.add_development_dependency "rspec", "2.12.0"
end
