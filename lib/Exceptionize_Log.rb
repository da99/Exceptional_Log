require 'Exceptionize_Log/version'

module Kernel

  private

  def Exceptionize_Log glob
    files = Dir.glob(glob)
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
  end # === def Exceptionize_Log
  
end # === Kernel
