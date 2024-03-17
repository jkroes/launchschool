#!/usr/bin/env ruby

# Input: string
# Output: boolean
# Requirements:
# The string contains at most one char from each pair
# No characters are repeated in the string

# NOTE I failed this exercise. I couldn't think of a succinct way
# to express this logic. Here is the example solution, which
# combines the two requirements above into one conditional. Make
# sure you understand why passing an element of BLOCKS to count
# (as a selector) satisfies the two requirements.

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

# After seeing the solution above, here is my attempt at a less
# clever, more literal solution

BLOCKS = [%w(B O), %w(X K), %w(D Q), %w(C P), %w(N A), %w(G T),
          %w(R E), %w(F S), %w(J W), %w(H U), %w(V I), %w(L Y),
          %w(Z M)]

def block_word?(string)
  upstring = string.upcase
  one_block_char = BLOCKS.none? do |(letter1, letter2)|
    upstring.include?(letter1) && upstring.include?(letter2)
  end
  no_dups = upstring.chars.tally.values.none? { |n| n > 1 }
  one_block_char && no_dups ? true : false
end

# NOTE Here's another user solution that's simpler than my own. I
# really feel like my solutions lack imagination. It might help
# to sound out the logic first. Convert input string to match the
# case of the blocks. Convert it to an array of strings. Iterate
# over each character, converting it to the matching block.
# Reduce array of blocks to the unique blocks. Compare to the
# size of the input string.

BLOCKS = [['b', 'o'], ['x', 'k'], ['d', 'q'], ['c', 'p'], ['n', 'a'],
          ['g', 't'], ['r', 'e'], ['f', 's'], ['j', 'w'], ['h', 'u'],
          ['v', 'i'], ['l', 'y'], ['z', 'm']]

def block_word?(str)
  downstr = str.downcase
  blocks = downstr.chars.map do |char|
    BLOCKS.find { |block| block.include?(char) }
  end.uniq
  blocks.size == str.size
end

LETTERS = [["B","O"], ["X","K"], ["D","Q"], ["C","P"], ["N","A"],
           ["G","T"], ["R","E"], ["F","S"], ["J","W"], ["H","U"],
           ["V","I"], ["L","Y"], ["Z","M"]]

p block_word?('baBy') == false
p block_word?('apples') == false
p block_word?('BUTCH') == false
p block_word?('BATCH') == true
p block_word?('jest') == true
