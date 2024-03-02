#!/usr/bin/env ruby

# The final value is [4, [3, 8]] because when arr[0] is
# incremented by 2, it points to a new integer 4.

# Meanwhile, a still points to 2 when it is subtracted from
# arr[1][0].

# b is [3, 8], because it is the array referenced by arr[1] and
# modified by arr[1][0] -= a

a = 2
b = [5, 8]
arr = [a, b]
# [2, [5, 8]]

arr[0] += 2
# [4, [5, 8]]
arr[1][0] -= a
# [4, [3, 8]]
p arr
