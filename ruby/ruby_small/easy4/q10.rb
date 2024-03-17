#!/usr/bin/env ruby

# NOTE The commented example solution uses the <=> operator in an
# interesting way. A user was able to refactor it to a single
# function call. You should be able to recognize the patter here.
# Th ternary operator is used to choose two values based on a
# single conditional. The spaceship operator returns one of three
# values based on comparison between two values. It isn't just
# useful for sorting algorithms.

CHARS = ('0'..'9').to_a

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(CHARS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  unless number.zero?
    prefix = number.negative? ? '-' : '+'
  end
  "#{prefix}#{integer_to_string(number.abs)}"
end

# def signed_integer_to_string(number)
#   case number <=> 0
#   when -1 then "-#{integer_to_string(-number)}"
#   when +1 then "+#{integer_to_string(number)}"
#   else         integer_to_string(number)
#   end
# end

# def signed_integer_to_string(int)
#   ['','+','-'][int <=> 0] + integer_to_string(int.abs)
# end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
