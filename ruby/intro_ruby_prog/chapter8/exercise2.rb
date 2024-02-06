#!/usr/bin/env ruby

# This program will return the block passed to execute. It will not print
# anything because the block will not be called.
# Edit: The block is returned specifically as a Proc object.

def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }
