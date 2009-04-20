module Automaton
  module Internal
    class Runner
      
      def initialize(filename=nil, &block)
        self.class.require!
        self.instance_eval(&block) if block
        if filename
          load(filename)
          exit
        end
      end
      
      class <<self

        def require!
          Plugins.libraries.each do |library|
            require library
            begin
              modu1e = File.basename(library, '.rb').camelize
              modu1e = eval("Automaton::#{modu1e}")
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