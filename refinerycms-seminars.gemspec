# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-seminars'
  s.version           = '2.1.0'
  s.description       = 'Ruby on Rails Seminars extension for Refinery CMS'
  s.date              = '2014-07-03'
  s.summary           = 'Seminars extension for Refinery CMS'
  s.authors           = ['William Makley']
  s.require_paths     = %w(lib)
  s.license           = 'MIT'

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',     '~> 2.1.2'
  s.add_dependency    'refinerycms-settings', '~> 2.1.0'
  s.add_dependency    'acts_as_indexed',      '~> 0.8.0'
  # s.add_dependency    'filters_spam',         '~> 0.2'
  s.add_dependency    'seo_meta',             '~> 1.4.0'
  s.add_dependency    'friendly_id',          '~> 4.0.4'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.1.2'
  s.add_development_dependency 'guard-rspec'
end
