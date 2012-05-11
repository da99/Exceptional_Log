require 'Exceptional_Log/version'


class Exceptional_Log < RuntimeError
  
  module Class_Methods
    
    def glob g
    files = Dir.glob(g)
    files.map { |f|
      full_path = File.expand_path(f)
      excep     = File.basename(f)
      msg       = full_path

      e_name = begin
                 excep
                 .sub(  /\.log\z/i,      '' )
                 .gsub( /[^a-z0-9A]+/i, '_')
                 .split( "_" )
                 .map(&:capitalize)
                 .join('_')
               end
      
      k = begin
            unless Object.const_defined?(e_name)
              c = Class.new(Exceptional_Log)
              Object.const_set e_name, c
            end
            
            Object.const_get e_name
          end

      e = k.new(msg)
      e.set_backtrace Split_Lines(File.read full_path )
      e.created_at = File.stat(full_path).atime

      e
    }
    end

  end # === Class_Methods
  
  module Base
    
    attr_accessor :created_at
    
    def [] name
      send name
    end

  end # === Base
  
  extend Class_Methods
  include Base

end # === Exceptional_Log
