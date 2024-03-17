#!/usr/bin/env ruby

def leading_substrings(string)
  result = []
  1.upto(string.size) do |count|
    result << string.slice(0, count)
  end
end

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
