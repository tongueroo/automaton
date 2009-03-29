require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

module Automaton
  module Internal
    describe 'lib/automaton.rb' do
      before(:all) do
        Plugins.directory = "#{SPEC}/fixtures"
        Plugins.require!
      end
      it 'should require plugin library files' do
        $".include?("#{SPEC}/fixtures/plugin/lib/plugin.rb").should == true
      end
    end
  end
end