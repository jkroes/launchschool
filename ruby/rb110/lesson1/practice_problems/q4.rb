#!/usr/bin/env ruby

# Returns {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}.
# each_with_object calls a block once for each element and
# returns the object it is passed. The block accepts each value
# (a string) and the object (a hash). The block assigns each
# string to the hash using a key consisting of the first element
# of each string.

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
