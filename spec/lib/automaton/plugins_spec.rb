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
            :plugin => "plugin",
            :names => ["task"],
            :paths => ["#{SPEC}/fixtures/plugin/auto_tasks/task.rb"]
          },
          {
            :plugin => "plugin2",
            :names => ["task", "task2"],
            :paths => [
              "#{SPEC}/fixtures/plugin2/auto_tasks/task.rb",
              "#{SPEC}/fixtures/plugin2/auto_tasks/task2.rb"
            ]
          },
          {
            :plugin => "questions",
            :names => [],
            :paths => []
          }
        ]
      end
    end
  end
end