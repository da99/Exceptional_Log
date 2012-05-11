
Exceptional\_Log
================

A Ruby gem to turn your log files into exceptions.

Installation
------------

    gem install Exceptional_Log

Usage
------

    require "Exceptional_Log"
    
    e = Exceptional_Log("/my_apps/logs/thin_a.log")
    
    e.class      # --> Thin_A 
    e.message    # --> '/my_apps/logs/thin_a.log'
    e.backtrace  # --> Array
    e.exception  # --> self
    e.created_at # --> File.stat(file).atime
    e.to_hash    # --> Hash[ :exception => ..., :message => ..., :created_at => ..., :backtrace => ... ]

Each exception is a subclass of `Exceptional_Log` and is named based on the basename of
the file path. 

Nginx/HTTP Error Logs
---------------------

For NGINX error logs (not access logs), try looking at 
[the Http\_Error\_Log](https://github.com/da99/Http_Error_Log).

Run Tests
---------

    git clone git@github.com:da99/Exceptional_Log.git
    cd Exceptional_Log
    bundle update
    bundle exec bacon spec/lib/main.rb

"I hate writing."
-----------------------------

If you know of existing software that makes the above redundant,
please tell me. The last thing I want to do is maintain code.

