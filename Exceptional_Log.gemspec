# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "Exceptionize_Log/version"

Gem::Specification.new do |s|
  s.name        = "Exceptionize_Log"
  s.version     = Exceptionize_Log_Version
  s.authors     = ["da99"]
  s.email       = ["i-hate-spam-45671204@mailinator.com"]
  s.homepage    = "https://github.com/da99/Exceptionize_Log"
  s.summary     = %q{Turn a file into an Exception-like object.}
  s.description = %q{

    Turn your log files into exceptions.
    The contents are used as a backtrace.

  }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'bacon'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'Bacon_Colored'
  s.add_development_dependency 'pry'
  
  # Specify any dependencies here; for example:
  # s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'Split_Lines'
end
