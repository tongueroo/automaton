$TESTING=true
SPEC = File.dirname(__FILE__)
$:.push File.expand_path("#{SPEC}/../lib")

require 'automaton'
require 'pp'

Spec::Runner.configure do |config|
end

def inspect(object)
  puts "<pre>"
  pp object
  puts "</pre>"
end