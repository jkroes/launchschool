#!/usr/bin/env ruby

=begin

A palindrome is a word, phrase, number, or other sequence of
characters which reads the same backward as forward. Examples of
numerical palindromes are:

2332
110011
54322345

You'll be given 2 numbers as arguments: (num,s). Write a function
which returns an array of s number of numerical palindromes that
come after num. If num is a palindrome itself, it should be
included in the count.

Return "Not valid" instead if any one of the inputs is not an
integer or is less than 0.

For this kata, single digit numbers will NOT be considered
 numerical palindromes.

=end

=begin
Input: first_num, num_palindromes
Output: Array of palindromes > first_num with length
 num_palindromes
Requirements:
- Include first_num in the output if it is a palindrome
- Test input type. Unless it is an intger, return "Not valid"
- Unless both inputs are > 0, return "Not valid"
- Single digit numbers are not palindromes
Algorithm:
- Create an array
- Loop
  - Start with first_num
  - Check whether number is a palindrome (subprocess)
  - If so, append to array
  - If length(array) == num_palindromes, break
- Return the array

- Palindrome is a number that has been reversed
- Use divmod to split a number. Add the reaminder to a sum var
- starting at 0. Do this until the number is zero. Compare the
- reversed number to a copy of the original number.

=end

def numeric_palindrome?(int)
  return false if int < 10

  current = int
  rev_arr = []
  while current > 0
    current, remainder = current.divmod(10)
    rev_arr << remainder
  end
  reversed = rev_arr.reduce(0) { |sum, digit| sum * 10 + digit }
  reversed == int
end

def palindromes_greater_than(int, count)
  all_positive_integers = int.is_a?(Integer) &&
                          count.is_a?(Integer) &&
                          int >= 0 && count >= 0

  return "Not valid" unless all_positive_integers

  pals = []
  while pals.size < count
    pals << int if numeric_palindrome?(int)
    int += 1
  end
  pals
end

p palindromes_greater_than(6,4) == [11,22,33,44]
p palindromes_greater_than(59,3) == [66,77,88]
p palindromes_greater_than(101,2) == [101,111]
p palindromes_greater_than("15651",5) == "Not valid"
p palindromes_greater_than(1221,"8") == "Not valid"
p palindromes_greater_than(-1,5) == "Not valid"
p palindromes_greater_than(-1,-5) == "Not valid"
p palindromes_greater_than(1,-5) == "Not valid"
p palindromes_greater_than(6,0) == []
