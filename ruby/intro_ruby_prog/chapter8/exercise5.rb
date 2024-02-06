#!/usr/bin/env ruby

# The code below accepts a single non-block argument, as indicated by the
# missing ampersand. When you pass a block, it isn't passed as the block
# argument in execute.

def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
