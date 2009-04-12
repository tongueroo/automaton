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
        yield
        Questions.running = false
      end
      
      class Questions
        
        @@questions = {}
        cattr_accessor :running, :questions
        
        class <<self
          
          def []=(method, value)
            @@questions[method] = value
          end
        
          def [](method)
            @@questions[method]
          end
        end
      end
    end
  end
end