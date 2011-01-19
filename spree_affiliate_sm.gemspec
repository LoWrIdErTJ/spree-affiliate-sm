version = '1.0.0'
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_affiliate_sm'
  s.version     = version
  s.summary     = 'Add gem summary here'
  s.description = 'Simple Affiliate feature'
  s.required_ruby_version = '>= 1.8.7'
  s.author            = 'NW'
  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.30.0.beta2')
end