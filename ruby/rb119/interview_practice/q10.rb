#!/usr/bin/env ruby

# 11:16
# 11:32

# Problem:
# Create a method:
# Input: A string of digits
# Return: count of even substrings (when converted to a number)

# Requirements:
# - Substrings may overlap
# - A substring may occur multiple times
# - Return zero if all digits are odd

# Algorithm:
# Find all substrings (subprocess)
# Convert to a number
# If the number is even, retain the substring
# Return a count of the even substrings

# Subprocess: find all substrings
# Iterate over the indices of the string
# Iterate over the possible lengths from that index to the end of
# the string
# Slice the string
# Collect the results

def even_substrings(string)
  substrings(string).select { |sub| sub.to_i.even? }.length
end

# def substrings(string)
#   subs = []
#   size = string.size
#   size.times do |i|
#     (i...size).each do |j|
#       subs << string[i..j]
#     end
#   end
#   subs
# end

def substrings(string)
  size = string.size
  (0...size).reduce([]) do |subs, i|
    subs += (i...size).map { |j| string[i..j] }
  end
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12
