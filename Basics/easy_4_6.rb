# easy_4_6.rb

=begin
input: an array of integers
output: an array of same number of integers where each is the sum of the integers before it in the original array


create sum_array = []
counter = 0
loop do
break if counter > array.length
if counter == 0 push array[0] to sum_array
else
array[counter] + sum_array[counter-1] push to sum_array
counter += 1
end
end

=end

def running_total(array)
  sum_array = []
  counter = 0
  loop do
    break if counter == array.length
    if counter == 0
      sum_array.push(array[0])
    else
      sum_array.push(array[counter] + sum_array[counter-1])
    end
    counter += 1
  end
  sum_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
p ''

def running_total(array)
  sum_array = []
  array.each_with_index do |x, index|
    index == 0 ? sum_array.push(x) : sum_array.push(x + sum_array[index-1])
  end
  sum_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
p ''


def running_total(array)
  sum = 0
  array.map do |x|
    sum += x
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
p ''

def running_total(array)
  new_array = []
  array.each_with_index do |x, index|
    new_array.push(array.slice(0..index).inject(:+))
  end
  new_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
p ''
