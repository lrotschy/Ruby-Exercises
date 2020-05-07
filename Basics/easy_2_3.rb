# easy_2_3.rb

# input: bill amount, tip rate as percent
# output: display the tip and the total(tip plus bill)
=begin
START
puts "What is the bill?"
collect input and save as bill variable
puts "What is the tip percentage?"
collect input and save as tip_percent variable
Calculate tip and save as variable: bill * tip_amount
calculate total and save as total: bill + tip_amount divided by 100

puts "The tip is #{tip_amount}."
puts "The total is {total}."
=end

def to_money(float)
  "$#{sprintf("%.2f", float)}"
end

puts to_money(123.4567)
puts to_money(1)
puts to_money(19.8)

puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f
tip_amount = (bill * tip_percent/100)
total = (bill + tip_amount)
puts "The tip is #{to_money(tip_amount)}."
puts "The total is #{to_money(total)}."
