#!/usr/bin/env ruby

# NOTE I technically didn't follow instructions. The question
# asked us to reuse the method from the previous question. I
# modified this method rather than calling it from a second
# method. My favorite solution contributed by a user is commented
# below.

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_signed_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  prefix = 1
  if ["+", "-"].include?(string[0])
    digits.shift
    prefix = -1 if (string[0] == "-")
  end

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  prefix * value
end

# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value
# end

# def string_to_signed_integer(string)
#   result = string_to_integer(string.delete('+-'))
#   string[0] == '-' ? -result : result
# end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
