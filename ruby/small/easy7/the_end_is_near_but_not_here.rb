#!/usr/bin/env ruby

def penultimate(string)
  string.split.slice(-2)
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Further exploration: Return the middle word of a phrase
# Test cases
# Empty string
# One word
# Even number of words
# Odd number of words

# Chooses the middle word(s) of a phrase
def middle(string)
  words = string.split
  size = words.size
  half = words.size / 2.0
  left = half.ceil - 1
  right = half.floor
  result = words.slice(left..right)
  result.join(" ") if result
end

p middle("")
p middle("one")
p middle("one two")
p middle("one two three")
p middle("one two three four")
