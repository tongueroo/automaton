require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

module Automaton
  module Internal
    describe Automaton::Questions do
      
      it 'should store questions' do
        Runner.new do
          questions do
            name "What is your name?"
            email "What is your email?"
          end
        end
        Questions::Questions.order.should == [ :name, :email ]
        Questions::Questions.questions.should == {
          :name => [ "What is your name?" ],
          :email => [ "What is your email?" ]
        }
      end
      
      it 'should optionally raise an exception after questions are stored' do
        Questions::Questions.raise_exception_when_finished = true
        rescued = false
        begin
          Runner.new do
            questions
          end
        rescue Questions::Finished
          rescued = true
        end
        rescued.should == true
      end
    end
  end
end