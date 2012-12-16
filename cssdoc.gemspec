require File.expand_path('../lib/cssdoc/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryo Nakamura"]
  gem.email         = ["r7kamura@gmail.com"]
  gem.description   = "Generates CSS styleduide as a web application"
  gem.summary       = "CSS styleguide generator"
  gem.homepage      = "https://github.com/r7kamura/cssdoc"

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
