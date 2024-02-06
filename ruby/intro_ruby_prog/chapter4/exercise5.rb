#!/usr/bin/env ruby

# There is a missing end keyword. The sole end is indended to the level of the
# method but it actually ends the if statement.

def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)
