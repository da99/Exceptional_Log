
require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.print e.message, "\n"
  $stderr.print "Run `bundle install` to install missing gems\n"
  exit e.status_code
end
require 'bacon'

Gem_Dir = File.expand_path( File.join(File.dirname(__FILE__) + '/../..') )
$LOAD_PATH.unshift Gem_Dir
$LOAD_PATH.unshift( Gem_Dir + "/lib" )

Bacon.summary_on_exit

require 'Exceptional_Log'
require 'Bacon_Colored'
require 'pry'

require 'Split_Lines'


# ======== Custom code.

# Nothing yet.




# ======== Include the tests.
target_files = ARGV[1, ARGV.size - 1].select { |a| File.file?(a) }

if target_files.empty?
  
  # include all files
  Dir.glob('./spec/*.rb').each { |file|
    require file.sub('.rb', '') if File.file?(file)
  }
  
else 
  # Do nothing. Bacon grabs the file.
  
end
