require 'Exceptional_Log/version'


class Exceptional_Log < RuntimeError
  
  module Class_Methods
    
    def glob g
    files = Dir.glob(g)
    files.map { |f|
      full_path = File.expand_path(f)
      excep     = File.basename(f)
      msg       = File.dirname(f)

      Hash[
        :exception => excep,
        :message  => msg,
        :backtrace => Split_Lines(File.read(full_path)),
        :created_at => File.stat(full_path).atime
      ]
    }
    end

  end # === Class_Methods
  
  extend Class_Methods
end # === Exceptional_Log
