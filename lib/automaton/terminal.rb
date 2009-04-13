module Automaton
  module Internal
    class Terminal
      def initialize(args)
        args.collect! do |a|
          a.downcase
        end
        if args.empty?
          list_tasks
        else
          run_tasks(args)
        end
      end
      
      def list_tasks
        Plugins.tasks.each do |task|
          puts task[:name]
        end
      end
      
      def run_tasks(args)
        args.each do |task|
          
        end
      end
    end
  end
end