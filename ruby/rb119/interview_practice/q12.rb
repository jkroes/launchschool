#!/usr/bin/env ruby

# 4:49
# 5:01

# Problem:
# Create a method with:
# - Input: string
# - Returns: boolean indicating whether string is a pangram
# - Requirements:
# - Pangrams contain every letter of the alphabet.
# - Ignore case (letters may be upper or lower case)

# Algorithm:
# - lowercase the string
# - tally the string's chars
# - concatenate the tally hash's keys
# - delete a range 'a-z' from the key string
# - if the key string is empty, return true; else false

def is_pangram(string)
  ('a'..'z').to_a.join.delete(string.downcase).empty?
end

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true
