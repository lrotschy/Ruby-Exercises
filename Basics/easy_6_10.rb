# easy_6_10.rb

# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.
#
# input: positive integer
# output: a right triangle whose sides have n stars
# rules: first line output will have n-1 spaces, 1 star ...
#         last line will have n stars
#
#         x + y = n
#         y = 1
#         x = n - y
#
#         loop
#         use kernel#format to print empty space x times , then puts * y times
#         y += 1
#         break if y = n

# def triangle(num)
#   stars = 1
#
#   loop do
#     spaces = num - stars
#     puts "#{' ' * spaces}#{'*' * stars}"
#     stars += 1
#     break if stars > num
#   end
# end
#
# triangle(5)
# triangle(9)
#
# to create a method to draw triangle with right angle at any corner
#
# input: num, corner
# output: triangle
#
# use same method but use cases in loop , change to counter so we can change what is printed without confusion

# def triangle(num, corner_position)
#   counter = 0
#
#   loop do
#     remainder = num - counter
#
#     case corner_position
#     when 'bottom_right'
#       puts "#{' ' * remainder}#{'*' * counter}"
#     when 'bottom_left'
#       puts "#{'*' * counter}#{' ' * remainder}"
#     when 'top_left'
#       puts "#{'*' * remainder}#{' ' * counter}"
#     when 'top_right'
#       puts "#{' ' * counter}#{'*' * remainder}"
#     end
#
#     counter += 1
#     break if counter > num
#   end
# end

# set counter to 0
# puts counter number of stars.rjust(num - counter)
# counter+= 1

def triangle(num, corner_position)
  counter = 0
  loop do
    case corner_position
    when 'bottom_right'
      puts "#{'*' * counter}".rjust(num)
    when 'bottom_left'
      puts "#{'*' * counter}"
    when 'top_left'
      puts "#{'*' * (num - counter)}"
    when 'top_right'
      puts "#{'*' * (num - counter)}".rjust(num)
    end
    counter += 1
    break if counter > num
  end
end

triangle(5, "bottom_right")
triangle(9, "bottom_left")
triangle(4, "top_left")
triangle(3, "top_right")
