#!/usr/bin/env ruby


# We're receiving a set of messages in code. The messages are
# sets of text strings, like: "alakwnwenvocxzZjsf"

# Write a method to decode these strings into numbers. The
# decoded number should be the number of lowercase characters
# between the first two uppercase characters. If there aren't two
# uppercase characters, the number should be 0.

# Input: string
# Output: integer
# Problem: Find the number of lowercase chars between the first
# two uppercase chars in the string, or zero.

# Algorithm:
# Find the first uppercase char
# Find the second uppercase char
# If both do not exist, return zero
# Split the string on these chars
# Select the second element of the array resulting from the split
# Return the length of this substring

CAPITALS = ?A..?Z

def decode_string(string)
  index = 0
  num_caps = 0
  lower_chars = ''

  loop do
    if index == string.size
      return 0
    end
    char = string[index]
    if CAPITALS.include?(char)
      num_caps += 1
      return lower_chars.size if num_caps == 2
    elsif num_caps == 1
        lower_chars << char
    end
    index += 1
  end
end

def decode(array)
  array.map { |str| decode_string(str) }
end

p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
p decode([]) == []
