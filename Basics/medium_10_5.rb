# medium_10_5.rb

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.
#
# input: an odd integer
# output: a 4 pointed diamond in an n x n grid -- i.e. the center of the diamond is n '*' wide.
#
# middle is n *
# next is n - 2, etc.
# last is 1
#
# set counter: number of stars = 1
# loop until number == n
# before star string interpolate n - number of stars / 2
# up to n string interpolate number star, (number + 2 star, number + 2 star)
# number += 2

require 'pry'
require 'pry-byebug'

# def print_line(n, num)
#   puts "#{' ' * (n-num/2)}#{'*' * num}#{' ' * (n-num/2)}"
# end
#
#
# def diamond(n)
#   num = 1
# # binding.pry
#   while num <= n
#     print_line(n, num)
#     num += 2
#   end
# num = n
#   while num > 1
#     num -= 2
#     print_line(n, num)
#   end
# end

def diamond(n)
  1.upto(n) { |num| puts "#{'*' * num}".center(n) if num.odd? }
  (n-2).downto(1) { |num| puts "#{'*' * num}".center(n) if num.odd? }
end

diamond(3)
diamond(9)
diamond(0)
diamond(20)
