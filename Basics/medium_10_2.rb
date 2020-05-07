# medium_10_2.rb

# Write a method that can rotate the last n digits of a number. For example:
#
#
# Note that rotating just 1 digit results in the original number being returned.
#
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
#
# You may assume that n is always a positive integer.

# input: integer, integer
# output: return first integer with second integer indicating the - index of the number that should be moved to end of array
#
# take index -n and move to end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# def rotate_rightmost_digits(integer, n)
#   num_arr = integer.digits.reverse
#   (num_arr[0..-n - 1] + [num_arr[-n + 1..-1]] + [num_arr[-n]]).flatten.join.to_i
# end

# def rotate_rightmost_digits(integer, n)
#   num_arr = integer.digits.reverse
#   (num_arr[0...-n] << rotate_array(num_arr[-n..-1])).flatten.join.to_i
# end

def rotate_rightmost_digits(integer, n)
  num_arr = integer.digits.reverse
  new_arr = num_arr[0...-n] << rotate_array(num_arr[-n..-1])
  new_arr.flatten.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
