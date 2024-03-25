#!/usr/bin/env ruby

# 10:29
# 10:38

# Problem:
# Create a method:
# - Input: array of integers
# - Return: the number of pairs of identical integers in the array
# Requirements:
# - Count each instance of a number as part of a pair only once. We are not
# interested in combinations.
# - There may be multiple pairs of the same value if there is
# more than one instance
# Algorithm:
# Tally each integer
# Divide each integer's count by 2 (rounding down)
# Sum all results

def pairs(integers)
  integers.tally.values.map { |n| n/2 }.sum
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3
