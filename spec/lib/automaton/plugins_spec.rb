require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

module Automaton
  module Internal
    describe Automaton::Internal::Plugins do
      
      before(:all) do
        Plugins.add @fixtures = "#{SPEC}/fixtures"
        @libraries = Plugins.libraries
        @tasks = Plugins.tasks
        # debug @libraries
        # debug @tasks
      end
      
      it "should provide an array of plugin library files" do
        @libraries.include?("#{@fixtures}/user-automaton-plugin-0.0.0/lib/plugin.rb").should == true
        @libraries.include?("#{@fixtures}/automaton-plugin2/lib/plugin2.rb").should == true
        @libraries.length.should == 2
      end
      
      it "should provide a hash of plugin task information" do
        @tasks.should == [
          {
            :path => "#{@fixtures}/user-automaton-plugin-0.0.0/auto/plugin/task.rb",
            :name => "plugin:task"
          },
          {
            :path => "#{@fixtures}/automaton-plugin2/auto/plugin2/task.rb",
            :name => "plugin2:task"
          },
          {
            :path => "#{@fixtures}/automaton-plugin2/auto/plugin2/task2.rb",
            :name => "plugin2:task2"
          }
        ]
      end
    end
  end
end