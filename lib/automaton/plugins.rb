module Automaton
  module Internal
    class Plugins
      
      @@directories = [
        "~/.auto",
        "#{File.dirname(__FILE__)}/../../vendor/plugins"
      ]
      @@plugins = nil
      
      cattr_accessor :directories
      
      class <<self
                
        def add(path)
          @@directories << path
          @@directories.uniq!
          @@plugins = nil
        end
        
        def plugins
          return @@plugins if @@plugins
          directories = @@directories.collect do |d|
            File.expand_path("#{d}/*/")
          end
          @@plugins = Dir[*directories].collect do |d|
            Plugin.new(d)
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
          @library = "#{directory}/lib/#{@name}.rb"
          @library = nil unless File.exists?(@library)
          # Task path example: ~/.auto/plugin/auto/task.rb
          @tasks = { :names => [], :paths => [] }
          Dir["#{directory}/auto_tasks/*.rb"].sort.collect do |path|
            @tasks[:paths] << path
            @tasks[:names] << File.basename(path, '.rb')
          end
        end
      end
    end
  end
end