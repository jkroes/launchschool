#!/usr/bin/env ruby

# 4:37
# 4:47

# Problem:
# Create a method
# - Input: nonempty lowercase string
# - return: array whose elements are a substring and an integer. the
# integer is the number of times the substring appears in the first

# Requirements:
# Minimize the returned substring and maximize the integer
# The returned substring may be the strin and the integer would
# be 1

def repeated_substring(string)
  (1..string.size).each do |len|
    sub = string[0, len]
    splits = string.split(sub, -1)
    return [sub, splits.count("") - 1] if splits.all?(&:empty?)
  end
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]
