module Automaton
  module Internal
    module Questions
      
      def self.included(base)
        base.send :alias_method, :method_missing_without_questions, :method_missing
        base.send :alias_method, :method_missing, :method_missing_with_questions
      end
      
      def method_missing_with_questions(method, *args)
        if Questions.running
          Questions[method] = args
        else
          method_missing_without_questions(method, *args)
        end
      end
      
      def questions(&block)
        Questions.running = true
        yield if block
        Questions.running = false
        if Questions.raise_exception_when_finished
          raise QuestionsFinished
        end
      end
      
      class Questions
        
        @@order = []
        @@questions = {}
        cattr_accessor :order, :questions, :raise_exception_when_finished, :running
        
        class <<self
          
          def []=(method, value)
            @@order << method
            @@questions[method] = value
          end
        
          def [](method)
            @@questions[method]
          end
        end
      end
      
      class QuestionsFinished < StandardError
      end
    end
  end
end