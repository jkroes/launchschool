#!/usr/bin/env ruby

# NOTE I missed this question. I only answered it halfway and
# failed to consider how the method in question uses the return
# value of a block.

# returns ['hi', 'hi', 'hi']
# The last evaluated expression is the return value of a block

[1, 2, 3].select do |num|
  num > 5
  'hi'
end
