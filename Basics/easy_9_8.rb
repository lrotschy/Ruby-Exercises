# easy_9_8.rb

# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.
#
# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

# input: two integers a, b
# output: a sequence of numbers a = how many in sequence, b = starting number, b * 1...b * a

# set range 1..b.map |n| n * a

def sequence(a, b)
  (1..a).map { |n| n * b }
end



p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) #== []