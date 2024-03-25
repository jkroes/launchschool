#!/usr/bin/env ruby

# 10:40
# 10:53

# Problem:
# Create a method:
# - Input: non-empty string of lowercase alpha chars
# - Output: length of the longest vowel ('aeiou') substring
# Requirements: defined entirely in the input and output. no edge
# cases

# Algorithm:
# init a len variable to 0
# Iterate over each index
# Iterate over all lengths starting from that index
# Slice the string from the index to that length
# If the slice consists of vowels, compare its length to len
# If length > len, set len to length
# After iteration ends, return len

def longest_vowel_substring(string)
  max_len = 0
  (0...string.size).each do |i|
    (i..string.size-i).each do |j|
      substr = string[i, j]
      if substr == substr.delete('^aeiou')
        len = substr.length
        max_len = len if len > max_len
      end
    end
  end
  max_len
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5
