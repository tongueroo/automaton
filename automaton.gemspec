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
  
  # = MANIFEST =
  s.files = %w[
    CHANGELOG.markdown
    MIT-LICENSE
    README.markdown
    Rakefile
    automaton.gemspec
    bin/auto
    lib/automaton.rb
    lib/automaton/class.rb
    lib/automaton/plugins.rb
    lib/automaton/require.rb
    lib/automaton/runner.rb
    lib/automaton/string.rb
    lib/automaton/terminal.rb
    spec/fixtures/automaton-plugin2/auto/plugin2/task.rb
    spec/fixtures/automaton-plugin2/auto/plugin2/task2.rb
    spec/fixtures/automaton-plugin2/lib/plugin2.rb
    spec/fixtures/user-automaton-plugin-0.0.0/auto/plugin/task.rb
    spec/fixtures/user-automaton-plugin-0.0.0/lib/plugin.rb
    spec/lib/automaton/plugins_spec.rb
    spec/lib/automaton/runner_spec.rb
    spec/spec.opts
    spec/spec_helper.rb
  ]
  # = MANIFEST =
end