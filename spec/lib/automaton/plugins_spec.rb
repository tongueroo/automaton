require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

module Automaton
  module Internal
    describe Automaton::Internal::Plugins do
      
      before(:all) do
        Plugins.add "#{SPEC}/fixtures"
        @libraries = Plugins.libraries
        @tasks = Plugins.tasks
        # debug @libraries
        # debug @tasks
      end
      
      it "should provide an array of plugin library files" do
        @libraries.include?("#{SPEC}/fixtures/plugin/lib/plugin.rb").should == true
        @libraries.include?("#{SPEC}/fixtures/plugin2/lib/plugin2.rb").should == true
        @libraries.length.should == 3
      end
      
      it "should provide a hash of plugin task information" do
        @tasks.should == [
          {
            :path => "/Users/winton/Sites/repositories/active/automaton/spec/fixtures/plugin/auto/plugin/task.rb",
            :name => "plugin:task"
          },
          {
            :path => "/Users/winton/Sites/repositories/active/automaton/spec/fixtures/plugin2/auto/plugin2/task.rb",
            :name => "plugin2:task"
          },
          {
            :path => "/Users/winton/Sites/repositories/active/automaton/spec/fixtures/plugin2/auto/plugin2/task2.rb",
            :name => "plugin2:task2"
          }
        ]
      end
    end
  end
end