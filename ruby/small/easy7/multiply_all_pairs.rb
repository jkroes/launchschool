#!/usr/bin/env ruby

def multiply_all_pairs(arr1, arr2)
  arr3 = []
  arr1.each do |int|
    arr2.each do |int2|
      arr3 << int * int2
    end
  end
  arr3.sort
end

# NOTE The use of product in the exapmle solution

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
