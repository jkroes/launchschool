#!/usr/bin/env ruby

# Given 2 two arguments of an array of numbers and a number, find
# all the pairs that results in the forming a triangle with the
# number. -- Justin

# Note: To determine if three numbers form a triangle you have
# touse the Triangle Inequality Theorem, which states that the
# sum of two side lengths of a triangle is always greater than
# the third side. If this is true for all three combinations of
# added side lengths, then you will have a triangle.

# Problem: Find two numbers within the input array that form a
# triangle when combined with a (third) input number.

# Input: array of numbers and one number

# Output: an array of arrays.

# Requirements:
# - A triangle has three sides such that for all
# sides, the sum of two sides' lengths exceeds the length of the
# third side
# - Output an empty array if there are no valid triangles

# Algorithm:
# Find all pairs within the input array.
# Combine with the third number.
# If the combo forms a valid triangle, append the pair to the
# results array.
# Return triangles

def find_triangle_pairs(sides, third_side)
  triangles = []
  sides.combination(2).map do |pair|
    cond1 = pair[0] + pair[1] > third_side
    cond2 = pair[0] + third_side > pair[1]
    cond3 = pair[1] + third_side > pair[0]
    triangles << pair if cond1 && cond2 && cond3
  end
  triangles
end

# Test cases
puts find_triangle_pairs([2, 3, 4, 5], 7) == [ [ 3, 5 ], [ 4, 5 ] ]
puts find_triangle_pairs([1, 2, 3, 4], 10) == []
puts find_triangle_pairs([7, 10, 12, 15], 9) == [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
puts find_triangle_pairs([8, 2, 5, 6, 3], 4) == [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]
