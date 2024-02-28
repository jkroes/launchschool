#!/usr/bin/env ruby

# NOTE My original solution failed to account for the fact that
# the space character is not a letter. I have commented it out
# and modified it to reach the desired solution.

statement = "The Flintstones Rock"

char_counts = {}
statement.delete('^a-zA-Z').each_char do |char|
  if !char_counts.key? char
    char_counts[char] = statement.count char
  end
end
puts char_counts.sort.to_h

# char_counts = {}
# statement.each_char do |char|
#   if !char_counts.key? char
#     char_counts[char] = statement.count char
#   end
# end
# puts char_counts
