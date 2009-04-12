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
        
        # Collectors
        
        def libraries
          collector { |plugin| plugin.library }
        end
        
        def tasks
          t = collector do |plugin|
            plugin.tasks.merge(:plugin => plugin.name)
          end
          t.sort { |a, b| a[:plugin] <=> b[:plugin] }
        end
        
      private
        
        def collector(&block)
          self.plugins.collect { |plugin| block.call(plugin) }.compact
        end
      end
      
      class Plugin

        attr_reader :name
        attr_reader :library
        attr_reader :tasks
        
        def initialize(directory)
          @name = File.basename(directory)
          # Only downcase directory structures without whitespace allowed
          return nil if @name != @name.downcase || @name.include?(' ')
          # Library path example: ~/.auto/plugin/lib/plugin.rb
          @library = "#{directory}lib/#{@name}.rb"
          @library = nil unless File.exists?(@library)
          # Task path example: ~/.auto/plugin/auto/task.rb
          @tasks = { :names => [], :paths => [] }
          Dir["#{directory}tasks/*.rb"].sort.collect do |path|
            @tasks[:paths] << path
            @tasks[:names] << File.basename(path, '.rb')
          end
        end
      end
    end
  end
end