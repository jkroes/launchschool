#!/usr/bin/env ruby

def rotate_array(array)
  array[1..-1] + array[0..0]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(number)
  number.to_s.size.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

#       |735291
# 3     |52917
# 32    |9175
# 321   |759
# 3215  |97
# 321579


# Further exploration

# Assuming I didn't have the above methods, this would be my
# solution. I think it is easier to understand.

def max_rotation(number)
  digits = number.to_s.split('')
  result = ''
  while digits.size > 0
    digits << digits.shift
    result << digits.shift
  end
  result.to_i
end

# The edge case of passing and returning a number consisting of
# multiple zeroes seems impossible. 0000 evaluates to 0 even
# before you can convert it to a string.

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
