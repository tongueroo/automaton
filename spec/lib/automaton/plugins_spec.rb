require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

module Automaton
  module Internal
    describe Automaton::Internal::Plugins do
      
      before(:all) do
        Plugins.directory = "#{SPEC}/fixtures"
        @libraries = Plugins.libraries
        @tasks = Plugins.tasks
        # inspect @libraries
        # inspect @tasks
      end
      
      it "should provide an array of plugin library files" do
        @libraries.include?("#{SPEC}/fixtures/plugin/lib/plugin.rb").should == true
        @libraries.include?("#{SPEC}/fixtures/plugin2/lib/plugin2.rb").should == true
        @libraries.length.should == 2
      end
      
      it "should provide a hash of plugin task information" do
        @tasks.should == [
          {
            :plugin => "plugin",
            :names => ["task"],
            :paths => ["#{SPEC}/fixtures/plugin/tasks/task.rb"]
          },
          {
            :plugin => "plugin2",
            :names => ["task", "task2"],
            :paths => [
              "#{SPEC}/fixtures/plugin2/tasks/task.rb",
              "#{SPEC}/fixtures/plugin2/tasks/task2.rb"
            ]
          }
        ]
      end
    end
  end
end