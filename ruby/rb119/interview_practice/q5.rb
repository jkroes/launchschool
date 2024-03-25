#!/usr/bin/env ruby

# 10:02
# 10:10 (first solution)
# 10:16 (second solution)

# Problem:
# Create a method that:
# - Accepts a string
# - Returns the most common character in the string
#   - Break ties by index of the first apperance of the character
# Requirements
#   - Uppercase and lowercase characters count as the same char
# Intermediate data structure: An array to hold most common
# characters
# Algorithm:
# Downcase the string
# Count each character in the string
# - tally?
# Find the chars with max count
# - chars, max_by
# Return the char with the lowest index
# - find

def most_common_char(string)
  string = string.downcase
  string.chars.max_by { |char| string.count char }
end

def most_common_char(string)
  string = string.downcase
  counts = Hash.new(0)
  string.each_char { |char| counts[char] += 1 }
  # counts.max_by { |k, v| v }.slice(0)
  counts.find { |k, v| v == counts.values.max }.slice(0)
end

p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'
