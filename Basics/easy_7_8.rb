# easy_7_8.rb

# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.
#
# input: two arrays, assume same length
# output: new array containing product of pair of numbers with same index
#
# init new arra
# call each with index on array 1
#   new_array << array 1[index] * array 2 [index]
# return new array
#
# counter = 0
# init new_array
# loop
# new_array << array 1[counter] * array 2[counter]
# counter += 1
# break if counter == array.length
# end
# new_array

# def multiply_list(array_1, array_2)
#   new_array = []
#   array_1.each_with_index do |elem, index|
#     new_array << (array_1[index] * array_2[index])
#   end
#   new_array
# end

def multiply_list(array_1, array_2)
  array_1.zip(array_2).map { |array| array.inject(:*)}
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
