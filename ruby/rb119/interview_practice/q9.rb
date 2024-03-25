#!/usr/bin/env ruby

# 10:54
# 11:07 (first solution)
# 11:12 (second solution)

# Problem:
# Create a method:
# - Input: two strings
# - Return: count of non-overlapping instances of string2 in
#   string1

# Reuqirements:
# - First string may be empty, but second string may not be
# - If first string is empty, return 0

# Algorithm:
# Split the string
# Return the maximum of 0 or the size of the array - 1

# Algorithm:
# Find

def count_substrings(s1, s2)
  count = 0
  string = s1
  while string.include? s2
    new_string = string.sub s2, ''
    if string == new_string
      break
    else
      count += 1
      string = new_string
    end
  end
  count
end

# NOTE This is a real use case of the second argument to
# String#split
def count_substrings(s1, s2)
  [0, s1.split(s2, -1).size - 1].max
end

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1
