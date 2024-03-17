#!/usr/bin/env ruby

# Problem:
# - Read a file
# - Print the longest sentence based on words
# - Sentences end with .?!
# - Words are any non-space, non-.?! characters

# NOTE The example solution (not shown below) uses
# Enumerable#max_by instead of iteration and a hash. It's a more
# efficient solution, but mine is generally applicable to other
# problems where we may not be finding a maximum.

text = File.read("longest_sentence.txt")
sentences = text.split(/[?!.]/)
sentence_hash = {}
sentences.each do |sentence|
  sentence_hash[sentence] = sentence.split.size
end
largest = sentence_hash.key(sentence_hash.values.max)
puts "Longest sentence:"
puts largest.strip
puts

# Further exploration: Retain the punctuation at the end of the
# printed string. NOTE See the documentation for split on the
# effect of Regexp groups on the returned array.
text = File.read("longest_sentence.txt")
splits, punctuation = text.split(/([?!.])/).partition
                        .with_index { |_, i| i.even? }
sentences = splits.zip(punctuation).map(&:join)
sentence_hash = {}
sentences.each do |sentence|
  sentence_hash[sentence] = sentence.split.size
end
largest = sentence_hash.key(sentence_hash.values.max)
puts "Longest sentence with trailing punctuation:"
puts largest.strip
puts

# NOTE My favorite user solution to this uses Regex lookbehind to
# match and split on the space following punctuation. A second
# user showed how to combine this with a character class.
text = File.read("longest_sentence.txt")
sentences = text.split(/(?<=[.?!])/)
sentence_hash = {}
sentences.each do |sentence|
  sentence_hash[sentence] = sentence.split.size
end
largest = sentence_hash.key(sentence_hash.values.max)
puts "Longest sentence with trailing punctuation:"
puts largest.strip
puts

# Further exploration: Longest paragraph
text = File.read("longest_sentence.txt")
paragraphs = text.split(/\n\n/)
paragraph_hash = {}
paragraphs.each do |paragraph|
  paragraph_hash[paragraph] = paragraph.split.size
end
largest = paragraph_hash.key(paragraph_hash.values.max)
puts "Longest paragraph:"
puts largest.strip
puts

# Further exploration: Longest word
text = File.read("longest_sentence.txt")
words = text.split(/\b/)
word_hash = {}
words.each do |word|
  word_hash[word] = word.size
end
largest = word_hash.key(word_hash.values.max)
puts "Longest word:"
puts largest.strip
