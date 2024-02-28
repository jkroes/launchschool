#!/usr/bin/env ruby

# take returns a new array with the first N elements of its
# calling array, where N is the integer passed to it. It is
# non-destructive, as detailed in the docs. One could also test
# the value of arr after calling take to confirm this.

arr = [1, 2, 3, 4, 5]
arr.take(2)
arr
