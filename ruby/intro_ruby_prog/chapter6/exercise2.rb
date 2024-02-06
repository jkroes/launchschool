#!/usr/bin/env ruby

# Returns 1. arr is:
# [["b"],
#  ["b", 2],
#  ["b", 3],
#  ["a", 1],
#  ["a", 2],
#  ["a", 3]]
arr = ["b", "a"]
arr = arr.product(Array(1..3))
arr.first.delete(arr.first.last)

# Returns
arr = ["b", "a"]
arr = arr.product([Array(1..3)])
arr.first.delete(arr.first.last)

# Returns [1,2,3]. arr is:
# [["b"],
#  ["a", [1,2,3]]]
