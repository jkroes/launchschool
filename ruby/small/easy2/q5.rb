#!/usr/bin/env ruby

# bob -> hello bob.
# bob! -> hello bob. why are we screaming?

print "What is your name? "
name = gets.chomp

msg =
  if name.end_with? ?!
    "hello #{name[0..-2]}. why are we screaming?".upcase
  else
    "Hello #{name}."
  end

puts msg
