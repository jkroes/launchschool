#!/usr/bin/env ruby

if false
  greeting = "hello world"
end

greeting

# Conditionals don't create a new scope, so variables initialized
# within them are visible outside of them; however, greeting is
# never initialized. It will throw an undefined local variable
# error.

# NOTE I was wrong. greeting is initialized even though the if
# clause never executes.
