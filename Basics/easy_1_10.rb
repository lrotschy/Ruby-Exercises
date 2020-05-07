# easy_1_10.rb

# input: a positive integer and a boolean
# output: half the salary if true, 0 if false
# What should it return? a number or puts the number?

def calculate_bonus(salary, boolean)
  if boolean
    bonus = salary / 2
  else
    bonus = 0
  end
  bonus
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
puts calculate_bonus(60000, true)
puts calculate_bonus(60000, false)

def calculate_bonus(salary, boolean)
  bonus =  boolean ? salary / 2 : 0
  bonus
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
puts calculate_bonus(60000, true)
puts calculate_bonus(60000, false)
