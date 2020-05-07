# easy_6_6.rb

# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

# input: two arrays
# output: one array containing all items from first two arrays, with no duplicates
#
# concat array 2 to array 1
# flatten new array
# uniq! to remove duplicates
# return array 1
#
# def merge(array_1, array_2)
#   (array_1 << array_2).flatten.uniq
# end
#
# def merge(array_1, array_2)
#   array_2.each do |elem|
#     array_1.push(elem) if array_1.include?(elem) == false
#   end
#   array_1.uniq
# end

def merge(array_1, array_2)
  array_1 | array_2
end

p merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]
