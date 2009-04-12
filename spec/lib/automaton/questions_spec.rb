require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

module Automaton
  module Internal
    describe Automaton::Internal::Questions do
      
      before(:all) do
        Plugins.directory = "#{SPEC}/fixtures"
        Runner.require!
      end
      
      it 'should store asked questions' do
        Runner.new do
          questions do
            name "What is your name?"
            email "What is your email?"
          end
        end
        Questions::Questions.questions.should == {
          :name => [ "What is your name?" ],
          :email => [ "What is your email?" ]
        }
      end
    end
  end
end