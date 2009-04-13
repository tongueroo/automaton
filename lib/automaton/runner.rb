module Automaton
  module Internal
    class Runner
      
      def initialize(filename=nil, &block)
        self.class.require!
        load(filename) if filename
        self.instance_eval(&block) if block
      end
      
      class <<self

        def require!
          Plugins.libraries.each do |library|
            require library
            begin
              modu1e = File.basename(library, '.rb').camelize
              begin
                modu1e = eval("Automaton::#{modu1e}")
              rescue
                modu1e = eval("Automaton::Internal::#{modu1e}")
              end
            rescue
              modu1e = nil
            end
            if modu1e && !included_modules.include?(modu1e)
              include modu1e
            end
          end
        end
      end
    end
  end
end