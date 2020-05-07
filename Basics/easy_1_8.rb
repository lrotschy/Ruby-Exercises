# easy_1_8.rb

=begin
input = an non-empty array of positive integers
so we don't have to worry about negative integers or empty arrays
output = return the average of all the numbers in the array

START
Add all the integers in the array -- sum = array.inject
sum / array.length
END
=end

def average(array)
  array.inject(:+) / array.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

def average(array)
  sum = 0
  array.each { |n| sum = sum + n }
  sum / array.length
end

puts ' '
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
