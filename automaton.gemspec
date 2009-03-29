Gem::Specification.new do |s|
  s.name    = 'automaton'
  s.version = '0.1.0'
  s.date    = '2009-03-29'
  
  s.summary     = "Automate everything!"
  s.description = "Automate everything!"
  
  s.author   = 'Winton Welsh'
  s.email    = 'mail@wintoni.us'
  s.homepage = 'http://github.com/winton/'
  
  s.executables << "auto"
  s.extensions  << "install"
  s.has_rdoc = false
  
  # = MANIFEST =
  s.files = %w[
    CHANGELOG.markdown
    MIT-LICENSE
    README.markdown
    Rakefile
    bin/auto
    gem_template.gemspec
    install
    lib/automaton.rb
    lib/automaton/plugins.rb
    spec/fixtures/plugin/lib/plugin.rb
    spec/lib/automaton.rb
    spec/lib/automaton/plugins.rb
    spec/spec.opts
    spec/spec_helper.rb
  ]
  # = MANIFEST =
end