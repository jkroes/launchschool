#!/usr/bin/env ruby

# 10:05
# 10:19

# Problem:
# Create a method
# - Input: String
# - Output: n/a
# - Return: New string. Upcase every second char of words with index
#   that is a multiple of 3

# Algorithm:

# Algorithm:
# Split input string on whitespace and save to an array
# Iterate from 2 to array.size with a step of 3.
# Index array by the iteration variable.
# Subprocess: Mutate (upcase) every second char of this word.
# Join array by whitespace
# Return new string

# Subprocess
# Iterate from 1 to to string.size with a step of 2
# Index word by iteration variable, upcase in place, and assign
# to locaiton in word
# Return string

def upcase_even(string)
  (1...string.size).step(2) do |i|
    string[i] = string[i].upcase
  end
  string
end

def to_weird_case(string)
  words = string.split
  (2...words.size).step(3) do |i|
    words[i] = upcase_even(words[i])
  end
  words.join(' ')
end

original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected
