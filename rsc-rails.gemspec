$:.push(File.expand_path('./lib', __dir__))

require 'rsc-rails/version'

Gem::Specification.new do |s|
  s.name        = 'rsc-rails'
  s.version     = RscRails::VERSION
  s.authors     = ['Cameron Dutro']
  s.email       = ['camertron@gmail.com']
  s.homepage    = 'https://github.com/camertron/rsc-rails'
  s.summary     = 'Reasonably Simple computer for Rails'
  s.description = 'Wraps the rsc.js project in a Rails embrace.'

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true

  s.add_dependency 'rails', '>= 3.1'
  s.add_dependency 'css-rewrite', '~> 2.0'

  s.require_path = 'lib'
  s.files = Dir[
    '{lib,app,spec}/**/*', 'Gemfile', 'CHANGELOG.md',
    'README.md', 'Rakefile', 'rsc-rails.gemspec', 'package.json',
    'package-lock.json'
  ]
end
