#!/usr/bin/env ruby

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# These will all have the same ID, because numbers and booleans
# are immutable objects.
