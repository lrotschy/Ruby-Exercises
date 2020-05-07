# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.
#
# You may assume that neither argument is an empty Array.
#
# Examples:

# def multiply_all_pairs(array_1, array_2)
#   array_1.product(array_2).map { |array| array.inject(:*)}.sort
# end
#
# input: two arrays of numbers
# output: teh product of every pair of numbers that can be formed from the two arrays, sorted by increasing value
#
# call map on array 1
#   call map on array 2
#     elem1 * elem 2
# flatten.sort result

def multiply_all_pairs(arr1, arr2)
  result = arr1.map do |elem1|
    arr2.map do |elem2|
      elem1 * elem2
    end
  end
  result.flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])# == [2, 4, 4, 6, 8, 8, 12, 16]
