module Automaton
  module Internal
    class Terminal
      def initialize(args)
        args.collect! do |a|
          a.downcase
        end
        if tasks?(args)
          tasks(args)
        elsif rdoc?(args)
          rdoc(args)
        end
      end
      
      def tasks?(args)
        args.delete('tasks') ||
        args.delete('t') ||
        args.delete('-T')
      end
      
      def tasks
        Plugins.tasks.each do |task|
          puts "#{task[:plugin]}:"
          task[:names].each do |name|
            puts "  #{name}"
          end
        end
      end
      
      def rdoc?(args)
        args.delete('rdoc') ||
        args.delete('r')
      end
      
      def rdoc(args)
        
      end
    end
  end
end