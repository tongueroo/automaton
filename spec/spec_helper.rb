$TESTING=true
SPEC = File.dirname(__FILE__)
$:.unshift File.expand_path("#{SPEC}/../lib")

require 'automaton/require'
require 'pp'

Spec::Runner.configure do |config|
end

def debug(object)
  puts "<pre>"
  pp object
  puts "</pre>"
end