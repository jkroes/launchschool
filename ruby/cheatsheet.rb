#!/usr/bin/env ruby


# Array
arr = [3, false, "hello"]

# Iterator: each
arr.each { |num| puts num }

# Multiarray
multi_array = [[0,1], [2,3,4]]

# Arrays are zero-indexed
multi_array[0][0]

# Hash literal
person = {
  "name" => "james",
  "age" => 30,
  "male?" => true
}

# Access a hash value with bracket notation
person["age"]

# Create an empty hash
lunch = Hash.new

# Add a hash key-value pair with bracket notation
lunch["protein"] = "chicken"

# Iterator: each
person.each do |key, value|
  puts "#{key}: #{value}"
end

# Hashes can have default values. The use case below is counting the words in a
# string provided by a user.
puts "Text: "
text = gets.chomp
words = text.split()
frequencies = Hash.new(0)
words.each do |w|
  frequencies[w] += 1
end

# Concatenation and conversion to string
"cloud" + 9.to_s

#A block that is passed into the sort method must return either 1, 0, or -1. It
#should return -1 if the first block parameter should come before the second, 1
#if vice versa, and 0 if they are of equal weight, meaning one does not come
#before the other (i.e. if two values are equal)

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]
# Sort our books in ascending order
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }
# Sort your books in descending order
books.sort! { |firstBook, secondBook| secondBook <=> firstBook}

# The splat operator prefixes the name of a method parameter that accepts a
#
extra_curriculars("chess club", "gymnastics", "anime club", "library services")

# Blocks are like anonymous functions
[1, 2, 3, 4, 5].each { |i| puts i }

# Hash keys can be strings but are better as symbols
hash = {:a => 1}

# There are two non-true values: false and nil. nil is returned when a hash key
# doesn't exist if not default value exists for the hash.
hash[:b]

# Unlike strings, symbols with the same value are identical. There is only one
# copy at a time. Symbols are immutable and save memory. They make for faster
# keys than strings.
:a.object_id == :a.object_id

# Convert between symbol and string
:sasquatch.to_s
"sasquatch".to_sym
"sasquatch".intern #same as above

# In Ruby 1.9, an easier hash syntax was created for symbolic keys
hash2 = {a: 1}
hash == hash2

# Build a hash programatically from alpha and numeric ranges
symbol_AZ = Hash[(:a..:z).zip((1..26))]

# Hashes have methods select (for filtering pairs), each_key, and each_value
 olympic_trials = {
  Sally: 9.58,
  John: 9.69,
  Bob: 14.91
}
olympic_trials.select { |name, time| time <  10.05 }

# Conditional assignment of a value if the variable does not exist or its value
# is nil
favorite_book ||= "Cat's Cradle"
puts favorite_book

# Ternary operator
tacos_eaten = 12
puts tacos_eaten >= 5 ? "Sir, you've had enough!" : "Keep eating tacos!"

# Like R, Ruby will return the result of the last evaluated expression in a
# function if return is omitted
def add(a,b)
  a + b
end
add 1,2

# .respond_to? takes a symbol representing a method name and returns true if
# that method can be called on the object and false otherwise.
puts "A".respond_to?(:push)
puts "A".respond_to?(:next)

# More iterators
"B".upto("F") { |letter| print letter, " " }
5.downto(0) { |num| print num, " " }

# The shovel operator << is an alternative to both .push and +
[1,2,3] << 4
"Hello " << "world"

# The .collect array method (an alias for .map) is like .each; however, it
# returns the results of calling a block on the array rather than the original
# array. This illustrates that the return value of a method is not necessarily
# the "return" value of a block. Blocks do not even have a return statement.
[1,2,3].collect { |n| n**2 }
[1,2,3].each { |n| n**2 }

# A method that accepts a block uses the yield keyword, possibly with
# parameters. Notice that the block is not an explicit parameter in the method def.
def yielder
  yield 1
end
yielder { |x| x }

# Almost everything in Ruby is an object; not blocks. This is why they can't be
# saved to a variable. But we can save procs, which are created by calling
# Proc.new with a block.
cube = Proc.new { |x| x ** 3 }
# Pass a proc with a leading ampersand.
[1, 2, 3].collect! &cube
# Invoke a proc's call method.
cube.call 3
# Convert a method symbol to a proc, then pass it to a second method
[1,2,3].map(&:to_i)

# Lambdas are like procs except (1) they check the number of args passed to it
# and (2) they return control back to the calling method.
def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc # Batmin will win!

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_lambda # Ironman will win!

# Semicolons can replace newlines and are useful for writing empty class or
# method definitions
class Test; end

# Classes have an .initialize methods that is called when we initialize a class
# instance via the .new method. Global, class, and instance variables are
# declared with $, @@, and @ prefixes. Methods defined within a class are
# instance methods, unless they are prefixed with the class name or self. Class
# methods can only be called from a class.
class Computer
  @@users = {}
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "New file #{filename}"
  end

  def self.get_users
    @@users
  end
end

my_computer = Computer.new("justin", 11111)
# This fails because it's a class method
my_computer.get_users
Computer.get_users

# A class can inherit from another via <. Methods defined in the subclass
# override the superclass, but the superclass's method can be called by using
# the super keyword.
class Trip
  def initialize(duration, price)
    @duration = duration
    @price = price
  end
end

spain_backpacking = Trip.new(14, 800.00)

class Cruise < Trip
  def initialize(duration, price, buffet)
    super(duration, price)
    @buffet = buffet
  end
end

carnival = Cruise.new(7, 2400.00, true)

# A subclass can inherit from only one (super)class, since multiple inheritance
# is forbidden in Ruby. Attempts to inherit from multiple classes will raise an
# error: superclass mismatch for class CLASS.
class A; end
class B; end
class C < A; end
class C < B; end

# In order to access private information, we have to create public methods that
# know how to get it. This separates the private implementation from the public
# interface. Methods are public by default. Methods that follow the public and
# private keywords are, well, what you would expect.
 class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  public    # This method can be called from outside the class.

  def about_me
    puts "I'm #{@name} and I'm #{@age} years old!"
  end

  private   # This method can't!

  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}."
  end
end

# Methods must be used to get and set object attributes...unless we use
# attr_reader and/or attr_writer. If we want both, we can simply use
# attr_accessor. The following are equivalent.
#
class Person
  attr_accessor :name
  def initialize(name); @name = name; end
end

class Person
  attr_reader :name
  attr_writer :name
  def initialize(name); @name = name; end
end

class Person
  def initialize(name); @name = name; end

  # Getter method
  def name; @name; end

  # Setter method
  def name=(value); @name = value; end
end

# Modules provide namespacing
module MyMod
  PI = 3.14
end

MyMod::PI

# Modules like math are built-in
Math::PI

# To use a module defined in another file, require the filename without the
# ".rb" extension. Then you can reference the module by name. E.g. date.rb
# defines the Date module.
require "date"
Date.today

# The include keyword allows a class to inherit a module's instance methods.
# This is called a mixin.
module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end

class Cricket
  include Action
  attr_reader :name
  attr_reader :distance
  def initialize(name)
    @name = name
  end
end

jiminy = Cricket.new("Jiminy")
jiminy.distance
jiminy.jump
jiminy.distance

# The extend keyword allows a class to inherit a module's class methods
module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent
end

TheHereAnd.now

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
