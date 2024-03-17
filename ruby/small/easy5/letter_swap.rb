#!/usr/bin/env ruby

# NOTE Multiple assignment can be used to swap elements of a
# collection without using intermediate variables. Note that Ruby
# creates a temporary array around the comma-separated elements
# on the RHS if you want to omit the brackets.

def swap(string)
  words = string.split
  words.map do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Further exploration: When you index a string, it creates a new
# string. If you index a string multiple times, pass it to a
# second method, then use multiple assignment, the parameters of
# the second method may swap object references, but this has no
# bearing on the original string in the calling method. For a
# second method to mutate a string, the string itself must be
# passed.
