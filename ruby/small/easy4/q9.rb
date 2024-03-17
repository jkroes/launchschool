#!/usr/bin/env ruby

# NOTE The commented example solution below uses loop to test
# whether the argument equals zero at the end of the loop body.
# This ensures that the loop runs at least once, which is
# necessary when the argument is zero.

CHARS = ('0'..'9').to_a

def integer_to_string(int)
  return '0' if int.zero?

  str = ''
  while int > 0
    digit = int % 10
    str << CHARS[digit]
    int = (int - digit) / 10
  end
  str.reverse
end

# def integer_to_string(number)
#   result = ''
#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(CHARS[remainder])
#     break if number == 0
#   end
#   result
# end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Further exploration:

# There don't appear to be any bang methods without a
# non-mutating form.

# Here is a partial list of non-bang, mutating methods for Ruby's
# `Array`, `String`, and `Hash` classes:

### Array
# - `<<` (append): Adds an element to the end of the array.
# - `push`: Appends one or more elements to the end of the array.
# - `pop`: Removes the last element from the array and returns it.
# - `shift`: Removes the first element from the array and returns it.
# - `unshift` or `prepend`: Prepends objects to the front of the array.
# - `delete`: Removes all items from the array that are equal to the argument.
# - `delete_at`: Deletes the element at the specified index.
# - `delete_if`: Deletes every element of the array for which the given block evaluates to true.
# - `clear`: Removes all elements from the array.

### String
# - `<<` or `concat`: Appends the given object to the string.
# - `clear`: Makes the string empty.
# - `replace`: Replaces the content of the string with the given content.
# - `insert`: Inserts a string into the string at a given index.
# - `prepend`: Prepends the given string to the string.

# Notice that delete is not a mutating method for String. See
# `String#delete` and `String#delete!`

### Hash
# - `[]=` (element assignment): Associates the value given by `value` with the key given by `key`.
# - `store`: Same as `[]=`, associates the value with the key.
# - `delete`: Deletes a key-value pair from the hash by key.
# - `delete_if`: Deletes every key-value pair from `hsh` for which `block` evaluates to true.
# - `clear`: Removes all key-value pairs from the hash.
# - `update`: Adds the contents of the given hash to `hsh`.
# - `replace`: Replaces the contents of the hash with the contents of another hash.
