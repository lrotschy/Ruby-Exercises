# easy_9_10.rb

# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.
#
# input: an array with inner arrays consisting of strings and integers.
# output: an array of strings, each the number of times as its paired integer in original array
#
# new array = []
# array.each
# array[1].times new array << array[0]

# def buy_fruit(array)
#   new_array = []
#   array.each do |inner_array|
#     inner_array[1].times { new_array.push(inner_array[0]) }
#   end
#   new_array
# end

def buy_fruit(array)
  array.map {|fruit, num| [fruit] * num}.flatten
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
