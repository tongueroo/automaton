require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

module Automaton
  module Internal
    describe Automaton::Internal::Plugins do
      before(:all) do
        Plugins.directory = "#{SPEC}/fixtures"
      end
      it "should provide an array of plugin library files" do
        Plugins.libraries.should == [ "#{SPEC}/fixtures/plugin/lib/plugin.rb" ]
      end
    end
  end
end