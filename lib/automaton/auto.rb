module Automaton
  module Internal
    class Auto
      def initialize(arguments)
        arguments.collect! { |a| a.downcase }
        debug = arguments.delete('debug') || arguments.delete('d')
        list = arguments.delete('tasks') || arguments.delete('t') || arguments.delete('-T')
        rdoc = arguments.delete('rdoc') || arguments.delete('r')
        tasks = arguments
        if list
          Plugins.tasks.each do |task|
            puts table([ task[:plugin] ], task[:names])
          end
        end
      end
    end
  end
end