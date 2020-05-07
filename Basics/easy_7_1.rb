# easy_7_1.rb

# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
#
# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# input: two arrays of same length, non-empty
# output:   a single array consisting of all elements of both in alternating order
#
# init new array
# set index = 0
# loop
#   push element at index 0 from each array to new array
#   increment index by 1
#   break when index == array length
# end
# return new array

# def interleave(arr_1, arr_2)
#   new_arr = []
#   index = 0
#   loop do
#     new_arr.push(arr_1[index])
#     new_arr.push(arr_2[index])
#     index += 1
#     break if index == arr_1.length
#   end
#   new_arr
# end
#
# use zip to create an array of array with elements interleaved. Flattent o return one array.

def interleave(arr_1, arr_2)
  arr_1.zip(arr_2).flatten
end 

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
