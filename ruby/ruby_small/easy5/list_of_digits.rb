#!/usr/bin/env ruby

# NOTE You can simplify this by using divmod (see second
# solution). See the third solution for idiomatic ruby.

def digit_list(int)
  digits = []
  while int > 0
    digit = int % 10
    digits.prepend(digit)
    int = (int - digit) / 10
  end
  digits
end

def digit_list(int)
  digits = []
  while int > 0
    int, digit = int.divmod(10)
    digits.prepend(digit)
  end
  digits
end

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
p digit_list(7) == [7]                     # => true
p digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
p digit_list(444) == [4, 4, 4]             # => true
