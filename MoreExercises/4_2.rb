# 4_2.rb
puts "the value of 40 + 2 is " + (40 + 2)

# It throws an error because (40 + 2) returns an integer, not a string. You need to use string interpolation or convert it to a string.

puts "the value of 40 + 2 is #{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s
