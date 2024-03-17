#!/usr/bin/env ruby

def short_long_short(a, b)
  if a.size < b.size
    a + b + a
  else
    b + a + b
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
