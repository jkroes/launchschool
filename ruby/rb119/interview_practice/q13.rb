#!/usr/bin/env ruby

# 5:06
# 5:14

# Problem:
# Create a method that
# - Input: two non-empty, lowercase, alpha strings
# - Return: boolean indicating whether any characters in the
# first string can be permutated to create the second string

# Algorithm:
# - Tally the letters in both strings
# - For all keys in the second tally, if the value of the first
# tally >= the value of the second tally, return true

def unscramble(s1, s2)
  t1, t2 = s1.chars.tally, s2.chars.tally
  t2.all? { |k, v2| v1 = t1[k]; !v1.nil? && v1 >= v2 }
end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true
