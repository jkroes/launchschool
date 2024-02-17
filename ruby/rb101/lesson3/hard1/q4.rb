#!/usr/bin/env ruby

def is_an_ip_number?(input)
  input = input.to_i
  (0..255).cover? input
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  return true
end

dot_separated_ip_address? '0.0.0.0'
dot_separated_ip_address? '0.0.0'
dot_separated_ip_address? '0.0.0.'
dot_separated_ip_address? '0.0.0.260'
