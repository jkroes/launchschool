#!/usr/bin/env ruby


def balanced?(string)
  left = right = 0
  string.each_char do |char|
    left += 1 if char == '('
    right += 1 if char == ')'
    return false if right > left
  end
  left == right
end

# NOTE Compare your solution to the example solution below.
# First, you could use break instead of return false. Second, the
# use of addition, subtraction, and zero? is just another
# implementation and another way to think about this problem.

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
puts

# Further exploration: Initial attempt

PAIRS = %w(() [] {} “” ‘’ ' ")

def all_balanced?(string)
  pair_counts = Hash.new(0)

  string.each_char do |char|
    pair = PAIRS.find { |pair| pair.include? char }
    # Non-pair character
    next unless pair
    # ASCII-quotes pair character
    if pair == char
      pair_counts[char] += pair_counts[char].zero? ? 1 : -1
    # Other pair character
    else
      pair_counts[pair] += (pair[0] == char ? 1 : -1)
      break if pair_counts[pair] < 0
    end
  end

  pair_counts.values.all?(&:zero?)
end


# Further exploration: Second attempt (ignore the warning about
# PAIRS)

PAIRS = %w(() [] {} “” ‘’)

def all_balanced?(string)
  pair_counts = Hash.new(0)
  string.each_char do |char|
    pair = PAIRS.find { |pair| pair.include? char }
    next unless pair
    pair_counts[pair] += (pair[0] == char ? 1 : -1)
    break if pair_counts[pair] < 0
  end

  balanced_pairs = pair_counts.values.all?(&:zero?)
  even_ascii_quotes = string.count("'\"").even?

  balanced_pairs && even_ascii_quotes
end

# Test cases. Credit: Richard Vu
p all_balanced?('[)') == false
p all_balanced?("I don't k{now} mmmm [] i[f ()t(h'is doesn't ('will work") == false
p all_balanced?('What (is) this?') == true
p all_balanced?('What is) this?') == false
p all_balanced?('What (is this?') == false
p all_balanced?('((What) (is this))?') == true
p all_balanced?('((What)) (is this))?') == false
p all_balanced?('Hey!') == true
p all_balanced?(')Hey!(') == false
p all_balanced?('What ((is))) up(') == false
p all_balanced?("He said, “I like turtles”.") == true
p all_balanced?("He said, “I like turtles.") == false
p all_balanced?("He said, I like turtles”.") == false
p all_balanced?("He said, ‘I like turtles’.") == true
p all_balanced?("“He said, ‘I like turtles’.”") == true
p all_balanced?('What [(is)] this?') == true
p all_balanced?('What [(is) this?') == false
p all_balanced?("He said, ‘I like turtles’.") == true
p all_balanced?("PHe said, ‘I like turtles’.P") == true
p all_balanced?('({What [(is) this]?)}') == true
p all_balanced?('What [(is]) this?') == true
