$TESTING=true
SPEC = File.dirname(__FILE__)
$:.unshift File.expand_path("#{SPEC}/../lib")

# If questions is vendored, require automaton from parent
automaton = File.expand_path("#{SPEC}/../../../../../automaton/lib")
if File.exists?(automaton)
  $:.unshift automaton
end

require 'automaton'
require 'questions'
require 'pp'

Spec::Runner.configure do |config|
end

def debug(object)
  puts "<pre>"
  pp object
  puts "</pre>"
end
