#!/usr/bin/env ruby

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
                ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.keys.zip(
  contact_data.map do |arr|
    {email: arr[0], address: arr[1], phone: arr [2]}
  end
).to_h

# NOTE The canonical answer is the following. I knew there was a function to
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
