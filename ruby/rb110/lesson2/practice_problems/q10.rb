#!/usr/bin/env ruby

# NOTE clone is not necessary here because we are not modifying
# the structure of the hash we iterate over; however, it is good
# practice to avoid mutating objects we iterate over. It is
# perhaps more efficient to simply create an empty array and
# modify that, as the example solution in comments does.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

p (
  arr.map do |hash|
    hash.clone.each do |key, num|
      hash[key] = num + 1
    end
    hash
  end
)

# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
#   incremented_hash = {}
#   hsh.each do |key, value|
#     incremented_hash[key] = value + 1
#   end
#   arr << incremented_hash
# end
