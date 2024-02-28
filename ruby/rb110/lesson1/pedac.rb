#!/usr/bin/env ruby

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which
# returns all the substrings from a given string which are
# palindromes. Consider palindrome words case sensitive.

# Input: string
# Output: strings
# rules:
#     explicit:
#         - return all substrings that are palindromes
#         - palindromes are case sensitive
#     implicit:
#         - assume input is a string
#         - edge cases:
#           - if the input is empty string, the output is empty
#             array
#           - if the input contains no palindromes, the output is
#             empty array
#         - a palindrome may contain a palindrome
#         - a palindrome may be as small as two of the same
#           letter
# algorithm:
#     - given a string
#     - find all substrings of length >= 2
#     - return the palindromes

def is_palindrome?(str)
  return str == str.reverse
end

def substrings(str, len)
  result = []
  index = 0
  while (index <= str.length - len)
    result << str[index, len]
    index += 1
  end
  result
end

# def all_substrings(str)
#   result = []
#   len = 2
#   while len <= str.size
#     result.push(*substrings(str, len))
#     len += 1
#   end
#   result
# end

def palindrome_substrings(str)
  (2..str.size).map {|len| substrings str, len }
    .flatten
    .filter {|substr| is_palindrome? substr}
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["dd", "cddc", "bcddcb"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
