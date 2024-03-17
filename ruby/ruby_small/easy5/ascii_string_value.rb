#!/usr/bin/env ruby

def ascii_value(string)
  string.codepoints.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further exploration
# ?1.ord.chr == ?1
# If a string is used instead of a character, #chr operates on
# the first character of the string
