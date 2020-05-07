# easy_6_5.rb

# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.
#
# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

# input: array
# output: a new array with the elements of original, but in reverse order
# rules: don't use array.reverse or array.reverse! or previous method

# initialize a new_arr
# array.map
# prepend each element to new_arr
# end
# new_arr

# def reverse(array)
#   new_array = []
#   array.each { |elem|new_array.prepend(elem) }
#   new_array
# end

# find array.length
# set counter to length-1
# new_array = []
# loop do
#   new_array.push(array[counter])
#   subtract 1 from counter
#   break if counter = 0
# end
# end

# def reverse(array)
#   index = array.length - 1
#   new_array = []
#
#   loop do
#     new_array.push(array[index])
#     index -= 1
#     break if index < 0
#   end
#   new_array
# end

# def reverse(array)
#   array.each_with_object([]) do |elem, array|
#     array.prepend(elem)
#   end
# end

def reverse(array)
  array.inject([]) { |memo, elem| memo.prepend(elem)}
end

# https://codequizzes.wordpress.com/2013/07/16/rubys-inject-method/

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 2, 3]                      # => [1, 2, 3]
p new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true
