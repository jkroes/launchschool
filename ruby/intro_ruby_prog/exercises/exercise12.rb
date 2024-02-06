#!/usr/bin/env ruby

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
                ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

updated = contacts.keys.zip(
  contact_data.map do |arr|
    {email: arr[0], address: arr[1], phone: arr [2]}
  end
).to_h

updated["Joe Smith"][:email]
updated["Sally Johnson"][:phone]
