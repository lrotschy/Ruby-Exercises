# medium_10_1.rb

# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.
#
# Do not use the method Array#rotate or Array#rotate! for your implementation.
# use .shift and .push to remove and then append item

# mutating method:
# def rotate_array!(array)
#   array.push(array.shift)
# end
#
# def rotate_array(array)
#   new_array = array[1..-1]
#   new_array << array[0]
# end

def rotate_array(array)
  array[1..-1] + [array[0]]
end


# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']
#
# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true
#
# def rotate_string(string)
#   string[1..-1] + string[0]
# end
#
#
# y = 'string'
# p rotate_string(y) == 'trings'
# p y == 'string'

def rotate_integers(int)
  rotate_array(int.digits.reverse).join.to_i
end

y = 123
p rotate_integers(y) == 231
p y == 123
