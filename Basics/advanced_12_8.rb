# advanced_12_8.rb
#
# merge sort
# input: array
# output: sorted array
# break down array elements into nested sub arrays
# then use merge method to recombine into sorted array
#
# if array.length == 1 return array
#
# divide array in half and set new array equal to an array containing the two halves
# do this recursively until all are length == 1
#
# call merge on first two recursively/iteratively until there is only one
require 'pry'
require 'pry-byebug'

def merge(arr1, arr2)
  idx1 = 0
  idx2 = 0
  new_array = []
  loop do
    break if arr1[idx1] == nil && arr2[idx2] == nil
    if arr1[idx1] == nil
      new_array.push(arr2[idx2])
      idx2 += 1
    elsif arr2[idx2] == nil
      new_array.push(arr1[idx1])
      idx1 += 1
    elsif arr1[idx1] < arr2[idx2]
      new_array.push(arr1[idx1])
      idx1 += 1
    elsif arr1[idx1] > arr2[idx2]
      new_array.push(arr2[idx2])
      idx2 += 1
    end
  end
  new_array
end

def rec_merge(array)
  return array if array.all? { |elem| elem.to_s.to_i == elem }
  return array if array.length == 1

  if array.all? { |arr| arr.length == 1 }
    new_array = merge(array[0], array[1])
  else
    new_array1 = rec_merge(array[0])
    new_array2 = rec_merge(array[1])
    new_array = merge(new_array1, new_array2)
  end
  new_array
end
#
def split_array(array)
  return array if array.length == 1
  half = (array.length - 1 )/ 2
  new_array = [split_array(array[0..half]), split_array(array[(half + 1)..-1])]
end

#
def merge_sort(original_array)
  new_array = split_array(original_array)
  rec_merge(new_array)
end
#
# p merge_sort([1])
# p merge_sort([9, 5, 7, 1])
# p merge_sort([5, 2, 4, 3, 1])

def merge_sort(array)
  p array
  return array if array.length == 1
  half = (array.length - 1 )/ 2
  new_array = [merge_sort(array[0..half]), merge_sort(array[(half + 1)..-1])]
  merge(new_array[0], new_array[1])
end
# p merge_sort([1])
# p merge_sort([9, 5, 7, 1])
p merge_sort([5, 2, 4, 3, 1])
