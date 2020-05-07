# easy_3_1.rb

=begin
input: get 6 numbers from user
output: a sentence that says whether or not the sixth number appears in the first five numbers

START
GET number from user
save number to array
(repeat 5 times)
GET number from user
if array.include?(number)
PRINT "The number #{number} appears in #{array}"
else
PRINT "The number #{number} does not appear in #{array}"
END

=end

=begin
number_array = []
5.times do
  puts "==> Enter the a number:"
  input = gets.chomp.to_i
  number_array.push(input)
end

puts "==> Enter the last number:"
number = gets.chomp.to_i

if number_array.include?(number)
  puts "==> The number #{number} appears in #{number_array}"
else
  puts "==> The number #{number} does not appear in #{number_array}"
end




number_array = []
input = ''
ordinal_numbers = ['1st', '2nd', '3rd', '4th', '5th', 'last']

ordinal_numbers.each_with_index do |num, index|
  puts "==> Enter the #{ordinal_numbers[index]} number:"
  input = gets.chomp.to_i
  number_array.push(input) unless index == 5
end

if number_array.include?(input)
  puts "==> The number #{input} appears in #{number_array}"
else
  puts "==> The number #{input} does not appear in #{number_array}"
end




=end
number_array = []
input = ''
ordinal_numbers = ['1st', '2nd', '3rd', '4th', '5th', 'last']

ordinal_numbers.each_with_index do |num, index|
  puts "==> Enter the #{ordinal_numbers[index]} number:"
  input = gets.chomp.to_i
  number_array.push(input) unless index == 5
end

included = number_array.include?(input)

puts "==> The numbers #{number_array} #{included ? 'does' : 'does not'} include #{input}"
