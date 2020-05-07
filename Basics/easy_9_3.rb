# easy_9_3.rb

# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.
#
# input: number
# output: if positive, negative, if 0 or negative, return original
#
# if number is greater than zero, -num, else num

def negative(num)
  num > 0 ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
