#!/usr/bin/env ruby

def substrings(string)
  result = []
  string.size.times do |index|
    1.upto(string.size - index) do |count|
      result << string.slice(index, count)
    end
  end
  result
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
