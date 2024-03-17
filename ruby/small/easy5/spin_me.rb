#!/usr/bin/env ruby

# This will produce a different string because of the roundtrip
# from string to array to string via split and join.

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"
