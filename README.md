
Exceptionize\_Log
================

A Ruby gem to turn your log files into exceptions.

Installation
------------

    gem install Exceptionize_Log

Usage
------

    require "Exceptionize_Log"
    
    Exceptionize_Log "/my_apps/logs/thin*.log"


Run Tests
---------

    git clone git@github.com:da99/Exceptionize_Log.git
    cd Exceptionize_Log
    bundle update
    bundle exec bacon spec/lib/main.rb

"I hate writing."
-----------------------------

If you know of existing software that makes the above redundant,
please tell me. The last thing I want to do is maintain code.

