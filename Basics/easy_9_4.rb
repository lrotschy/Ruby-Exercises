# easy_9_4.rb

# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.
#
# You may assume that the argument will always be a valid integer that is greater than 0.

# input: integer
# output: a sequence of integers from 1 to arguemnt
#
# set range from 1..arg.map itself

def sequence(num)
  #(1..num).map { |x| x }

  # if num > 0
  #   (1..num).to_a
  # elsif num < 0
  #   (num..0).to_a
  # end
  0 if num == 0
  num > 0 ? (1..num).to_a : (num..0).to_a
end

p sequence(5) #== [1, 2, 3, 4, 5]
p sequence(3) #== [1, 2, 3]
p sequence(1) #== [1]
p sequence(-5)
p sequence(0)
