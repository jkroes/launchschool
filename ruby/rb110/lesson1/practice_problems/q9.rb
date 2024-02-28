#!/usr/bin/env ruby

# NOTE I got this wrong. map is not like filter. The return value
# is [nil, 'bear']

# The return value of map is ['bear']
# map calls a block with each element of the hash, then returns
# an array whose elements are the return values of the block.
# Here, the block returns strings with length > 3.
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
