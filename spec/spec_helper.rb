SPEC = File.dirname(__FILE__)
$:.push File.expand_path("#{SPEC}/../lib")
$TESTING=true

require 'automaton'

Spec::Runner.configure do |config|
end
