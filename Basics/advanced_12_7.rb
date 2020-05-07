# advanced_12_7.rb

# input: two sorted arrays
# output: a single sorted array containing all items from inputs
# rules:
#   elements must be added in their proper order
#   original arrays must not be mutated
#
# set two counters to track indices of arrays
# compare first two using current indices
# break if both are nil
# if either is nil, push other to new array and increment
# whichever is smaller, push to new array and increment counter

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

# def merge(arr1, arr2)
#   idx1 = 0
#   idx2 = 0
#   new = []
#
#   loop do
#     break if (idx1 >= arr1.length) && (idx2 >= arr2.length)
#     # binding.pry
#     if idx1 >= arr1.length
#       new << arr2[idx2..-1]
#       break
#     elsif idx2 >= arr2.length
#       new << arr1[idx1..-1]
#       break
#     end
#
#     if arr2[idx2] == nil || arr1[idx1] <= arr2[idx2]
#       new << arr1[idx1]
#       idx1 += 1
#     elsif arr1[idx1] == nil || arr1[idx1] > arr2[idx2]
#       new << arr2[idx2]
#       idx2 += 1
#     end
#
#   end
#   new.flatten
# end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
