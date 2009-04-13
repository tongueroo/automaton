require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

module Automaton
  module Internal
    describe Automaton::Internal::Runner do
  
      before(:all) do
        Plugins.add "#{SPEC}/fixtures"
      end
  
      it 'should require plugin library files' do
        Runner.new
        # Fixture
        $".include?("#{SPEC}/fixtures/plugin/lib/plugin.rb").should == true
        $".include?("#{SPEC}/fixtures/plugin2/lib/plugin2.rb").should == true
        # Vendor
        $".include?(
          File.expand_path("#{SPEC}/../vendor/plugins/questions/lib/questions.rb")
        ).should == true
      end
  
      it 'should include all plugin library modules' do
        runner = Runner.new
        # Fixture
        runner.public_methods.include?('plugin').should == true
        runner.public_methods.include?('plugin2').should == true
        # Vendor
        runner.public_methods.include?('questions').should == true
      end
    end
  end
end