#!/usr/bin/env ruby

def rotate_array(array)
  array[1..-1] + array[0..0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

def rotate_string(string)
  return string if string.empty?
  rotate_array(string.chars).join
end

p rotate_string('')
p rotate_string('apples')

def rotate_integers(integer)
  rotate_array(integer.digits.reverse).reduce(0) { |total, digit| 10 * total + digit }
end

p rotate_integers(0)
p rotate_integers(10)
p rotate_integers(51)
p rotate_integers(501)
p rotate_integers(12345)
