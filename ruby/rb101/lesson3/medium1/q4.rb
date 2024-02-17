#!/usr/bin/env ruby

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# The first implementation returns the original, mutated array,
# and the second implementation returns a new array.
