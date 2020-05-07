# easy_2_2.rb

# input: length of room in meters, width of room in meters
# output: area of room in square meters and square feet
# 1 square meter = 10.7639 square feet

=begin
START
ask for length and assign variable with gets.chomp.to_f
ask for width and assign variable with gets. chomp.to_f
multiply l * w and assign to square_meters variable
multiply square_meters * 10.7639 and assign to square feet
puts result
=end

puts 'Enter the length of your room in meters:'
l = gets.chomp.to_f
puts 'Enter the width of your room in meters:'
w = gets.chomp.to_f
square_meters = l * w
square_feet = square_meters * 10.7639
puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."

# 10, 10 = 100, 1076.39
# 1, 1 = 1, 10.7639

puts 'Enter the length of your room in meters:'
l = gets.chomp.to_f
puts 'Enter the width of your room in meters:'
w = gets.chomp.to_f
puts "The area of the room is #{l * w} square meters (#{l * w * 10.7639} square feet)."


SQUARE_FEET_TO_INCHES = 144
SQUARE_INCHES_TO_CENTIMETERS = 929.03
puts 'Enter the length of your room in feet:'
l = gets.chomp.to_f
puts 'Enter the width of your room in feet:'
w = gets.chomp.to_f
square_feet = l * w
puts "The area of the room is #{square_feet.round(2)} square feet (#{square_feet * SQUARE_FEET_TO_INCHES.round(2)} square inches and #{square_feet * SQUARE_INCHES_TO_CENTIMETERS.round(2)} square centimeters)."
