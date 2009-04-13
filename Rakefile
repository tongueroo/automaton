require 'rake'
require 'rubygems'
require 'spec/rake/spectask'

GEM_NAME = 'automaton'
task :default => "#{GEM_NAME}.gemspec"

file "#{GEM_NAME}.gemspec" => FileList[ '{lib,spec}/**', 'Rakefile' ] do |f|
  # Read spec file and split out manifest section
  spec = File.read(f.name)
  parts = spec.split("  # = MANIFEST =\n")
  fail 'bad spec' if parts.length != 3
  # Determine file list from git ls-files
  files = `git ls-files`.
    split("\n").
    sort.
    reject{ |file| file =~ /^\./ }.
    reject { |file| file =~ /^doc/ }.
    map{ |file| "    #{file}" }.
    join("\n")
  # Piece file back together and write
  parts[1] = "  s.files = %w[\n#{files}\n  ]\n"
  spec = parts.join("  # = MANIFEST =\n")
  File.open(f.name, 'w') { |io| io.write(spec) }
  puts "Updated #{f.name}"
end

# Install the gem
task :install do
  `sudo gem uninstall #{GEM_NAME} -x`
  `gem build #{GEM_NAME}.gemspec`
  `sudo gem install #{GEM_NAME}*.gem`
  `rm #{GEM_NAME}*.gem`
end

desc 'Run specs'
task :spec => [ 'spec:automaton', 'spec:plugins' ]

namespace :spec do
  
  desc "Run automaton specs"
  Spec::Rake::SpecTask.new(:automaton) do |t|
    t.spec_opts = ["--format", "specdoc", "--colour"]
    t.spec_files = FileList["spec/**/*_spec.rb"]
  end
  
  desc "Run vendor/plugins specs"
  Spec::Rake::SpecTask.new(:plugins) do |t|
    t.spec_opts = ["--format", "specdoc", "--colour"]
    t.spec_files = FileList["vendor/plugins/*/spec/**/*_spec.rb"]
  end
end