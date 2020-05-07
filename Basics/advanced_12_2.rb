# advanced_12_2.rb
#
# input: odd integer greater than 7
#
# output: 8 pointed star
#
# line by line:
#
# center: n stars, no spaces, centered
# next out: 3 stars, 1 space, centered(n)
# next: 3 stars, 2 spaces, centered(n)
# etc. until stars plus spaces = n
#
# center
# x = o
#
# top half:
# x = (n - 3)/2
# loop
# puts star, x spaces, star, x spaces, star.center(n)
# x -= 1
# break when x < 0
#
# center line: n stars
#
# bottom half:
# y = 0
# next: star, y spaces, star, y spaces, star.center(n)
# next x += 1
# break if x + 3 > n

def star(n)
  x = (n - 3)/2
  loop do
    puts "*#{' ' * x}*#{' ' * x}*".center(n)
    x -= 1
    break if x < 0
  end
  puts "#{'*' * n}"
  y = 0
  loop do
    puts "*#{' ' * y}*#{' ' * y}*".center(n)
    y += 1
    break if y > (n - 3) / 2
  end
end

p star(7)
p star(9)
p star(21)

# this is just a big diamond:
# def print_circle(diameter)
#   x = 1
#   loop do
#     puts "#{'*' * x}".center(diameter)
#     x += 3
#     break if x > diameter
#   end
#   loop do
#     puts "#{'*' * x}".center(diameter)
#     x -= 3
#     break if x <= 0
#   end
# end

print_circle(25)
print_circle(10)
print_circle(49)
