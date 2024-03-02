#!/usr/bin/env ruby

# NOTE The example solution is very simple, but just study it and
# get comfortable with the layers of iteration happening.

arr = [{a: [1, 2, 3]},
       {b: [2, 4, 6],
        c: [3, 6],
        d: [4]},
       {e: [8],
        f: [6, 10]}]

result = arr.select do |hsh|
  hsh.values.flatten.all? {|num| num.even? }
end

p result

# arr.select do |hsh|
#   hsh.all? do |_, value|
#     value.all? do |num|
#       num.even?
#     end
#   end
# end
