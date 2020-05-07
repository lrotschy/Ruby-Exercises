# easy_6_9.rb

# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

# input: array, value
# output: true if array includes value, false otherwise
# rules: can't use include?

def include?(array, comparison_value)
  return_value = false
  array.each do |elem|
    return_value = true if comparison_value == elem
  end
  return_value
end

def include?(array, value)
  array.any? { |elem| value == elem }
end

# def include?(array, value)
#   !!array.find_index(value)
# end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
