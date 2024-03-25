#!/usr/bin/env ruby

# Here are two ways to find all contiguous subarrays of an
# array. Notice the use of inject and concatenation
# to ensure the return value is an array of arrays, rather than
# an array of arrays of arrays

def contiguous_subarrays(x)
  (0...x.size).reduce([]) do |arr, i|
    arr += (1..x.size - i).map { |len| x[i, len] }
  end
end

def contiguous_subarrays2(x)
  (0...x.size).reduce([]) do |arr, i|
    arr += (i...x.size).map { |j| x[i..j] }
  end
end

x = [*24..27]
p contiguous_subarrays x
p contiguous_subarrays2 x

# Here's a way to find all pairs if you cannnot use the
# combination method. Notice how similar it is to the
# definition of contiguous_subarrays2

def find_pairs(x)
  (0...(x.size-1)).reduce([]) do |pairs, i|
    pairs += ((i+1)...x.size).map { |j| [x[i], x[j]] }
  end
end

p find_pairs([10, 20, 30, 40])
