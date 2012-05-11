
Exceptional\_Log
================

A Ruby gem to turn your log files into exceptions.

Installation
------------

    gem install Exceptional_Log

Usage
------

    require "Exceptional_Log"
    
    Exceptional_Log "/my_apps/logs/thin*.log"

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

