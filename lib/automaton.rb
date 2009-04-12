require File.dirname(__FILE__) + "/automaton/class"
require File.dirname(__FILE__) + "/automaton/plugins"
require File.dirname(__FILE__) + "/automaton/questions"
require File.dirname(__FILE__) + "/automaton/runner"
require File.dirname(__FILE__) + "/automaton/string"

module Automaton
  module Internal
    # Require all plugin library files
    Runner.require!
    # Internal plugins
    Runner.send(:include, Questions)
  end
end
