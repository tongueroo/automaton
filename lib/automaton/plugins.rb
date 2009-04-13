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
          t = collector { |plugin| plugin.tasks }
          t.flatten.sort do |a, b|
            a[:name].gsub(':', '0') <=> b[:name].gsub(':', '0')
          end
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
          @tasks = Dir["#{directory}/auto/**/*.rb"].sort.collect do |path|
            relative = path.gsub("#{directory}/auto/", '')
            {
              :name => relative[0..-4].split('/').join(':'),
              :path => path
            }
          end
        end
      end
    end
  end
end