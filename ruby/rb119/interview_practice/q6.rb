#!/usr/bin/env ruby

# 10:23
# 10:28

# Problem
# Create a method:
# - Input: string
# - Return: hash with keys equal to string chars and values equal
# to chars count
# - Requirements:
# - Only count lowercase letters / ignore punctuation and
# uppercase lettesr
# - Return {} for empty string or a string without letters

def count_letters(string)
  string.delete('^a-z').chars.tally
end

expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}
