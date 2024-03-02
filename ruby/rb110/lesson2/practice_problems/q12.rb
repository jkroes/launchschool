#!/usr/bin/env ruby

# The example solution with each is, like I suspected, easier to
# read and more compact. In this example there is no advantage,
# but with more complex blocks, you may need to explicitly return
# a hash at the end if you choose to use each insteaed of
# each_with_object.

arr = [[:a, 1],
       ['b', 'two'],
       ['sea', {c: 3}],
       [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = arr.each_with_object({}) do |subarr, hsh|
  hsh[subarr[0]] = subarr[1]
end

p hsh
