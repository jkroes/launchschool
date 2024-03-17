#!/usr/bin/env ruby

# NOTE Because the shovel operator returns the array, it can be
# chained

def interleave(arr1, arr2)
  arr3 = []
  arr1.each_index do |idx|
    arr3 << arr1[idx] << arr2[idx]
  end
  arr3
end

# Further exploration

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
