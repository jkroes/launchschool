#!/usr/bin/env ruby

# NOTE You can simply use #delete instead of #gsub when the
# replacement is the empty string

def word_sizes(string)
  lengths = string.split.map do |word|
    word.gsub(/[^a-zA-Z]/, "").length
  end
  lengths.uniq.each_with_object({}) do |len, counts|
    counts[len] = lengths.count(len)
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
