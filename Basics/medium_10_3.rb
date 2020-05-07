# medium_10_3.rb
# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.
#
# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.


require 'pry'
require 'pry-byebug'


# def rotate_array(array)
#   array[1..-1] << array[0]
# end
#
# def rotate_rightmost_digits(integer, n)
#   num_arr = integer.digits.reverse
#   new_arr = num_arr[0...-n] << rotate_array(num_arr[-n..-1])
#   new_arr.flatten.join.to_i
# end
#
# def max_rotation(integer)
#   x = integer.digits.length
#   num = integer
#   #binding.pry
#   loop do
#     num = rotate_rightmost_digits(num, x)
#     x -= 1
#     break if x <= 1
#   end
#   num
# end

def max_rotation(integer)
  int_arr = integer.digits.reverse
  index = 0
  loop do
    break if index >= int_arr.length - 1
    int_arr = (int_arr[0...index] << int_arr[(index + 1)..-1] << int_arr[index]).flatten
    index += 1
  end
int_arr.join.to_i
end


p max_rotation(735291) #== 321579
p max_rotation(3) #== 3
p max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) #== 7_321_609_845
