#!/usr/bin/env ruby

def merge(arr1, arr2)
  arr3 = arr1.clone
  arr2.each_with_object(arr3) do |int, arr3|
    arr3 << int if !arr3.include? int
  end
end

# NOTE example solution
def merge(array_1, array_2)
  array_1 | array_2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
