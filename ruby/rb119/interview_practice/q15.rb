#!/usr/bin/env ruby

# 6:09

# Input: string of digits with length > 4
# Return: max product of any four contiguous digits (integer)
# Algorithm:
# find all length-4 substrings
# - iterate from 0 to string.size - 4
# - slice string by iteration var and length of 4
# for each substring:
# - Convert to numbers
# - Convert to digits
# - Product
# return max of products

def greatest_product(digit_string)
  products = (0..digit_string.size-4).map do |i|
    digit_string[i, 4].to_i.digits.reduce(:*)
  end
  products.max
end

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 4 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6
