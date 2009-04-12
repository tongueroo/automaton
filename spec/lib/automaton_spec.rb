require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

module Automaton
  module Internal
    describe 'lib/automaton.rb' do
      
      before(:all) do
        Plugins.directory = "#{SPEC}/fixtures"
        Runner.require!
      end
      
      it 'should require plugin library files' do
        $".include?("#{SPEC}/fixtures/plugin/lib/plugin.rb").should == true
        $".include?("#{SPEC}/fixtures/plugin2/lib/plugin2.rb").should == true
      end
      
      it 'should include plugin library modules' do
        runner = Runner.new
        runner.public_methods.include?('plugin').should == true
        runner.public_methods.include?('plugin2').should == true
      end
      
      it 'should include internal plugins' do
        runner = Runner.new
        runner.public_methods.include?('questions').should == true
      end
    end
  end
end