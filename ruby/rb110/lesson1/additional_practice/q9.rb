#!/usr/bin/env ruby

# NOTE The example solution shortened the block to one line by
# using String#capitalize

def titleize(string)
  words = string.split.map do |word|
    word[0] = word[0].upcase
    word
  end
  words.join(?\s)
end

p titleize "the flintstones rock"
