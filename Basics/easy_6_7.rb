# easy_6_7.rb

# Write a method that takes an Array as an argument, and returns two Arrays that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

# input: array
# output: two arrays containing first and second half of original respectively.
# rules: if odd number of elements, middle element goes in first half
#
# if array.length.odd?
#   first_half = (array.length/2) + 1
#
# else
#   first_half = (array.length/2)
#
# init first_half_array containing array[0..first_half]
# init second_half_array containing array[first_half + 1.. -1]
# return both arrays

# def halvsies(array)
#   if array.length.odd?
#     first_half = (array.length / 2)
#   else
#     first_half = (array.length / 2) - 1
#   end
#
#   first_half_array = array[0..first_half]
#   second_half_array = array[first_half + 1..-1]
#   [first_half_array, second_half_array]
# end
#
# def halvsies(arr)
#   arr.length.odd? ? first = (arr.length / 2) : first = (arr.length / 2) - 1
#   [first_arr = arr[0..first], second_arr = arr[first + 1..-1]]
# end

# def halvsies(arr)
#   return [[], []] if arr.empty?
#   first_half = arr.length/2.0.ceil
#   [arr[0..first_half], arr[first_half + 1..-1]]
# end



p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]
