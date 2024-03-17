#!/usr/bin/env ruby

def sum_of_sums(array)
  array.size.times.reduce(0) do |sum, idx|
    sum + array.slice(0..idx).sum
  end
end

# NOTE This example solution seems more efficient. Notice
# how it distills the problem into a simple form. We are really
# just adding each number to a running sum, then adding the
# running sum to a sum of sums.

def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

# # NOTE The second example solution uses the start-length syntax
# # for slice

def sum_of_sums(numbers)
  1.upto(numbers.size).reduce(0) do |sum, count|
    sum + numbers.slice(0, count).sum
  end
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
