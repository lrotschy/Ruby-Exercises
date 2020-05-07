# easy_2_4.rb When will I retire?

=begin
input: get age, retirement age
output: retirement year and how many years until them

START
PRINT "What is your age?"
age = gets.chomp
PRINT "What age would you like to retire?"
retirement_age = gets.chomp
retirement_age - current age
years_left = retirement_age - current age
retirement_year = current year + years_left
puts "It's 2018. You will retire in #{retirement year}."
puts "You only have #{years_left}to go!"
END
=end

current_year = Time.now.year
puts "What is your age?"
age = gets.chomp.to_i
puts "What age would you like to retire?"
retirement_age = gets.chomp.to_i
years_left = retirement_age - age
retirement_year = current_year + years_left
puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You only have #{years_left} years to go!"
