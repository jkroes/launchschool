#!/usr/bin/env ruby

# The example solution uses #map and #delete instead of #each and
# #delete!. The problem said to return an array of "the same
# string values," which I interpreted to mean object identity.
# Either one works.

# input: array of strings
# output: array of strings with vowels removed
# rules:
#  explicit: mutate the array strings
#  implicit: case must be considered

def remove_vowels(array)
  array.each do |word|
    word.delete!('aeiouAEIOU')
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
