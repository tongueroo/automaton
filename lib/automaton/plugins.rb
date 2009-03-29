module Automaton
  module Internal
    class Plugins
      @@directory = File.expand_path("~/.auto")
      @@plugins = nil
      class <<self
        def directory=(path)
          @@directory = path
          @@plugins = nil
        end
        def libraries
          self.plugins.collect do |plugin|
            plugin.library
          end
        end
        def plugins
          return @@plugins if @@plugins
          # Find directories in ~/.auto (plugins)
          directories = Dir["#{@@directory}/*/"]
          @@plugins = directories.collect do |directory|
            Plugin.new(directory)
          end
          @@plugins.compact!
          @@plugins
        end
        def require!
          self.libraries.each do |library|
            require library
          end
        end
      end
      class Plugin
        attr_reader :name
        attr_reader :library
        def initialize(directory)
          @name = File.basename(directory)
          # Library file structure: ~/.auto/plugin/lib/plugin.rb
          @library = "#{directory}lib/#{@name}.rb"
          return nil unless File.exists?(@library)
        end
      end
    end
  end
end