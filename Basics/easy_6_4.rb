# easy_6_4.rb

# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.
#
# You may not use Array#reverse or Array#reverse!.

# input: array
# output: the same array with the elements in reverse order
# rules: don't use array#reverse or reverse!
# must return same object id

# calculate array.length
# divide by two , save as num
# left_index = 0
# right_index = -1
# num.times do
# swap array values by assigning two variables at once
# left += 1
# right -= 1
# return array

def reverse!(arr)
  num = arr.length/2
  left_idx = 0
  right_idx = -1
  num.times do
    arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
    left_idx += 1
    right_idx -= 1
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list #== [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
result = reverse!(list) # => ["e", "d", "c", "b", "a"]
p list #== ["e", "d", "c", "b", "a"]
p list.object_id == result.object_id


list = ['abc']
result = reverse!(list)
p list == ["abc"]
p list.object_id == result.object_id

list = []
result = reverse!(list)
p list == []
p list.object_id == result.object_id
