#!/usr/bin/env ruby

# NOTE The example solution (commented below) is simpler than
# mine. It chains String#chars and Array#map. My digits should
# probably be DIGITS, because it is constant. Finally,
# multiplication and reassignment of the total is cleverly used
# instead of += and exponentiation.

def string_to_integer(str)
  digits = 0..9
  num_arr = []
  str.each_char do |char|
    digit = digits.select { |digit| digit.to_s == char }
    num_arr.unshift(digit[0])
  end

  total = 0
  num_arr.each_with_index do |num, idx|
    total += num * (10**idx)
  end
  total
end

# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }
# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value
# end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
