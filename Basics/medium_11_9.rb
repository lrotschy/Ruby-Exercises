# medium_11_9.rb

# bubble sort
#
# input: an array of numbers
# output: the same array, mutated with numbers in order from least to greatest
# use bubble sort
# on each iteration, compare each pair of number
# if the first is greater, switch them
# done when no changes are made
#
# create loop
# set changes variable to false inside loop
#  0..length - 2 each do
#    if array n > array n + 1,
#      array n, array n + 1 = array n +1, array n
#      changes = true
#    end
#  end
# if changes = false, break
# end loop
# array


def bubble_sort!(array)
  n = array.length
  loop do
    changes = false
    (0..(n - 2)).each do |n|
      if array[n] > array[n + 1]
        array[n], array[n + 1] = array[n + 1], array[n]
        changes = true
      end
    end
    n = n - 1
    break if changes == false
  end
  array
end

array = [5, 3]
p bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
