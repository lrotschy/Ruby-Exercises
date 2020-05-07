# easy_2_7.rb

# input: an integer greater than 0 , s for sum or p for product
# output: the sum or product of all the integers between 1 and the input
# Questions: do we need to validate the number? Or provide a rescue error message?

=begin
START
PRINT request for integer greater than 0
save integer as variable number = gets.chomp.to_i
create range from 1..number
PRINT request for s or p
if s
 total = range.sum
 puts "The product of the integers between 1 and #{number} is #{total}"
elsif p
 total = range.inject(:*)
 puts "The product of the integers between 1 and #{number} is #{total}"
end
=end

=begin
def prompt(string)
  puts ">> #{string}"
end

number = ''

loop do
  prompt("Please enter an integer greater than 0:")
  number = gets.chomp.to_i
  break if number > 0 and number.to_s.to_i == number
  puts "That is not a valid input."
end
  numbers = (1..number)

loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  operation = gets.chomp
  if operation.downcase == 's'
   total = numbers.inject(:+) #.sum in later versions of ruby
   puts "The product of the integers between 1 and #{number} is #{total}"
   break
  elsif operation.downcase == 'p'
   total = numbers.inject(:*)
   puts "The product of the integers between 1 and #{number} is #{total}"
   break
  else
   puts "You must enter either 's' or 'p'"
  end
end


=end

def prompt(string)
  puts ">> #{string}"
end

def valid_input?(number)
  (number.to_i > 0) && (number.to_i.to_s == number)
end

def input_range_sum(input)
  (1..input.to_i).inject(:+)
end

def inpput_range_product(input)
  (1..input.to_i).inject(:*)
end


number = ''

loop do
  prompt("Please enter an integer greater than 0:")
  number = gets.chomp
  if valid_input?(number)
    break
  else
    puts "That is not a valid input."
  end
end


loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  operation = gets.chomp
  if operation.downcase == 's'
    total = input_range_sum(number)
    puts "The product of the integers between 1 and #{number} is #{total}"
   break
  elsif operation.downcase == 'p'
    total = input_range_product(number)
    puts "The product of the integers between 1 and #{number} is #{total}"
   break
  else
   puts "You must enter either 's' or 'p'"
  end
end
