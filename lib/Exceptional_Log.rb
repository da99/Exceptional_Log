require 'Exceptional_Log/version'
require "Classy_Name"

class Exceptional_Log < RuntimeError
  
  module Class_Methods
    
    def convert file
      f = file
      full_path = File.expand_path(f)
      lines     = Split_Lines(File.read(full_path))
      msg       = full_path

      return nil if lines.empty?

      e_name = Classy_Name(File.basename(f).sub( /\.log\z/i, '' ))
      
      k = begin
            unless Object.const_defined?(e_name)
              c = Class.new(Exceptional_Log)
              Object.const_set e_name, c
            end
            
            Object.const_get e_name
          end

      e = k.new(msg)
      e.set_backtrace lines
      e.created_at = File.stat(full_path).atime

      e
    end

  end # === Class_Methods
  
  module Base
    
    attr_accessor :created_at
    
    def [] name
      send name
    end

    def to_hash
      keys = %w{ exception message backtrace created_at }
      keys.inject(Hash[]) { |memo, k|
        memo[k.to_sym] = send(k) 
        memo
      }
    end
    
  end # === Base
  
  extend Class_Methods
  include Base

end # === Exceptional_Log
