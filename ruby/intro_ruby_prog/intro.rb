#!/usr/bin/env ruby

# This method returns 1, because assignment returns the assigned value
def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number


# The gets method gets user input including trailing newline. The chomp method
# removes the trailing newline. This has no impact on puts but does impact
# print.
print "Enter text: "
print input # On its own line
print input.chomp # On its own line
print input # On the previous line because of chomp

# Blocks are a do...end pair that follow a method call.

# Method calls and method invocation are interchangeable terms

# puts returns nil; p returns an object
p 1

# Order of precedence for oeprators:
# 1. <=, <, >, >=
# 2. ==, !=
# 3. &&
# $. ||

# Ternay operators are reserved for choosing betwen values e.g. with
# conditional assignment. They are also good for converting complex truthy
# values to a literal true or false
x = true ? 1 : 2
nil || 1 ? true : false

# case statement: with an argument
a = 5

case a
when 5
  puts "a is 5"
when 6
  puts "a is 6"
else
  puts "a is neither 5 nor 6"
end

# case statement: without an argument
case
when a == 5
  puts "a is 5"
when a == 6
  puts "a is 6"
else
  puts "a is neither 5 nor 6"
end

# Read Ruby carefully. The following is not testing whether x == 5. Remember
# that all values except false and nil are true when used with conditionals
if x = 5
  puts "how can this be true?"
else
  puts "it is not true"
end

# You can test diferent types for equality, but comparison with e.g. > will
# throw an error
'124' == 124
124 > '124'

# do/while loops:
# While loops check a condition, then execute their code. do/while loops
# execute code, then check a condition to see whether they should repeat. In
# Ruby, do/while loops can be emulated by the loop method.
loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  end
end

# There is another construct in Ruby, but Matz (Ruby's creator) apparently does
# not recommend it
begin
  puts "Do you want to do that again?"
  answer = gets.chomp
end while answer == 'Y'

# A method ending in ! usually but not always indicates that the method
# will mutate the caller; we call themd destructive. Some methods like .pop and
# .push are also destructive and lack a trailing !.

# shift is to unshift as pop is to push
x = [1,2,3,4]
x.push(5)
x.pop
x.unshift(0)
x.shift

# Predicates are methods ending in ?. They return a boolean value.

# The methods for iterating over an array's elements and returning the original
# array are: each, each_index, and each_with_index.
x = ['a', 'b', 'c']
x.each_with_index do | v,i | puts "#{i}: #{v}" end

# While the splat operator stores extra arguments in an array, a hash can
# accept a variable number of named arguments
def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
         " years old and I live in #{options[:city]}."
  end
end

greeting("Bob")
greeting("Bob", {age: 62, city: "New York City"})
# NOTE Curly braces are not required when hash is the last argument
greeting("Bob", age: 62, city: "New York City")

# As of Ruby 1.9, arrays preserve order of its elements

# Searching for documentation is slightly different in irb than in pry. In irb,
# type "show_doc", return, then the search term. In pry, type "ri", a space,
# the search term, then return.
#
# Alternatively, install pry-doc, evaluate `require 'pry-doc'`, then use either
# show-doc, show-source -d, or `? ` (space) with a search term.

# To debug a method with pry without editing the source, type:
# binding.pry; METHOD

# =~ returns the index of a match between a regexp and string or nil
# NOTE There are some minor differences between String#=~ and RegExp#=~. If you
# go to an irb console and type show_doc, then =~, help will be shown for
# multiple types of arguments. Search for "Implementation from String" or
# "Implementation from Regexp" to see the differences.
"powerball" =~ /b/
/b/ =~ "powerball"

# .match method returns a MatchData object or nil
/b/.match("powerball")

# Methods can accept blocks. The block must always be the last parameter in the
# method definition. The block argument is prefixed with an ampersand.
def take_block(number, &block)
  block.call(number)
end

number = 42
take_block(number) do |num|
  puts "Block being called in the method! #{num}"
end

# Procs are more flexible. They can be passed in any position without an
# ampersand.
def take_proc(proc)
  [1, 2, 3, 4, 5].each do |number|
    proc.call number
  end
end

proc = Proc.new do |number|
  puts "#{number}. Proc being called in the method!"
end

take_proc(proc)

# Ruby's version of try-catch is begin-rescue-end. The rescue keyword can also
# be used in-line. Here rescue is triggered when we try to call the .each
# method on an integer.
zero = 0
zero.each { |element| puts element } rescue puts "Can't do that!"

# Here we specify a specific type of error
def divide(number, divisor)
  begin
    number / divisor
  rescue ZeroDivisionError => e
    e.message
  end
end

puts divide(4, 0)

# Practice exercise 16 from the end of the book
# My solution:
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
                ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
contacts.keys.zip(
  contact_data.map do |arr|
    {email: arr[0], address: arr[1], phone: arr [2]}
  end
).to_h
# The canonical answer is the following. I knew there was a function to
# get a hash index, but for the life of me I couldn't find it because it's a
# method of Enumerable, not Hash. I think the syntax of enclosing hash
# key-value pairs in parens within the block parameters is new as well. It also
# destructively modifies contact_data via .shift.
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end
