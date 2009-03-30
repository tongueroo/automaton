BASE = File.expand_path(File.dirname(__FILE__) + "/..")
# vendor
require BASE + "/vendor/ropen/lib/ropen"
require BASE + "/vendor/terminal-table/lib/terminal-table"
# automaton
require File.dirname(__FILE__) + "/automaton/auto"
require File.dirname(__FILE__) + "/automaton/plugins"
Automaton::Internal::Plugins.require!
