#!/usr/bin/env ruby

# 6:28
# 6:34

# input: alphanumeric string
# return: case-insensitive count of alphanumeric characters that
# occur more than once
# requirements:
# - input only contains alphanumeric chars
# - count number of unique chars, not instances, that occur
#   multiple times
# algorithm:
# - downcase string
# - conver the string to chars
# - select chars that occur at least twice
# - unique chars
# - return length of array

def distinct_multiples(string)
  string = string.downcase
  string.chars.filter { |char| string.count(char) > 1 }.uniq.size
end

p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5
