# medium_11_10.rb


# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.
#
# input: integer
# output: difference between sum of first n positive integers, squared, and the sum of square of first n postitive integers
#
# a = (1..n).to_a.sum ** 2
# b = (1..n).to_a.each { |x| x * x }.sum
#
# b - a

def sum_square_difference(n)
  a = (1..n).to_a.sum ** 2
  b = (1..n).to_a.map { |x| x * x }.sum

  a - b
end

p sum_square_difference(3) #== 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10)# == 2640
p sum_square_difference(1) #== 0
p sum_square_difference(100) #== 25164150
