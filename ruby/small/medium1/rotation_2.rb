#!/usr/bin/env ruby

def rotate_array(array)
  array[1..-1] + array[0..0]
end

def rotate_rightmost_digits(integer, num_right)
  digits = integer.digits.reverse
  rotated = digits[0...-num_right] + rotate_array(digits[-num_right..-1])
  rotated.reduce(0) { |total, digit| 10 * total + digit }
end

# NOTE The example solution makes use of a more idiomatic
# solution (roundtrip to string and back) plus array mutation.
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
