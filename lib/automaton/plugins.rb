require 'rubygems'

module Automaton
  module Internal
    class Plugins
      
      @@directories = [
        Gem.dir + "/gems",
        "~/.auto",
        "#{File.dirname(__FILE__)}/../../vendor/plugins"
      ]
      @@plugins = nil
      
      cattr_accessor :directories
      
      class <<self
        
        # Add a directory to the plugin load paths.
        def add(path)
          @@directories << path
          @@directories.uniq!
          @@plugins = nil
        end
        
        # Returns an array of Plugin instances.
        def plugins
          return @@plugins if @@plugins
          directories = @@directories.collect do |d|
            File.expand_path("#{d}/*automaton-*/")
          end
          @@plugins = Dir[*directories].collect do |d|
            Plugin.new(d)
          end
          @@plugins.compact!
          @@plugins
        end
        
        # Returns an array of library file paths.
        def libraries
          collector { |plugin| plugin.library }
        end
        
        # Returns a sorted array of hashes that describe tasks.
        def tasks
          t = collector { |plugin| plugin.tasks }
          t.flatten.sort do |a, b|
            a[:name].gsub(':', '0') <=> b[:name].gsub(':', '0')
          end
        end
        
      private
        
        # A quick way to get an array of @@plugins attributes.
        def collector(&block)
          self.plugins.collect { |plugin| block.call(plugin) }.compact
        end
      end
      
      # Stores a plugin's name, library, and tasks.
      class Plugin

        attr_reader :name
        attr_reader :library
        attr_reader :tasks
        
        # Assigns attributes using a plugin directory path.
        def initialize(directory)
          name = File.basename(directory)
          name = name.split('-')
          
          return nil unless name.include?('automaton')
          @name = name[name.index('automaton') + 1]
          
          # ~/.auto/automaton-plugin/lib/plugin.rb
          @library = "#{directory}/lib/#{@name}.rb"
          @library = nil unless File.exists?(@library)
          
          # ~/.auto/automaton-plugin/auto/task.rb
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