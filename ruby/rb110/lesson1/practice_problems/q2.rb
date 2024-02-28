#!/usr/bin/env ruby

# #count counts the number of elements in the array for which the
# # block returns a truthy value, per the docs.

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
