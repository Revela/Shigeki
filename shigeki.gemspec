# frozen_string_literal: true

require_relative 'lib/shigeki/version'

Gem::Specification.new do |spec|
  spec.name = 'shigeki'
  spec.version = Shigeki::VERSION
  spec.authors     = ['Tom Qin', 'Jonathan Evans']
  spec.email       = ['xqin@revela.co', 'jevans@revela.co']

  spec.summary = 'A Stimulus Wrapper'
  spec.description = 'A class based approach to setting Stimulus data attributes in haml files'
  spec.homepage = 'https://github.com/Revela/Shigeki'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Revela/Shigeki'
  spec.metadata['changelog_uri'] = 'https://github.com/Revela/Shigeki/blob/main/CHANGELOG.md'

  spec.files = ['lib/shigeki.rb']
  spec.require_paths = ['lib']
end
