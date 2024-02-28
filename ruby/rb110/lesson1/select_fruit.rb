#!/usr/bin/env ruby

def select_fruit(produce)
  produce.select do |key, value|
    value == 'Fruit'
  end
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}
