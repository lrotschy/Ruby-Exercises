# easy_1_3.rb

# input = a positive integer
# output = an array that lists all digits in the integer
# convert input to array
# then convert array items to integers (almost forgot that!)
# validate integer?
=begin
def digits(int)
  int.split.map {|n| n.to_i}
end

def valid_positive_int?(int)
  int.to_i.to_s == int || int >= 0 rescue false
end

# p valid_positive_int?(0)
# p valid_positive_int?(3)
# p valid_positive_int?(-156)
# p valid_positive_int?('hello')

input = ''
loop do
  puts "Give me a positive integer, please."
  input = gets.chomp
  if valid_positive_int?(input)
    break
  else
    puts 'That is not a valid positive integer.'
  end
end
p digits(input)

=end


# Pick off digits one at a time
# divide input by 10 and reset value of input
# move remainder to array
# continue until input%10 = 0
# move last number to array
# reverse array order

def digit_list(int)
  digit_array = []
  num = int

  loop do
    last_num = num % 10
    digit_array.push(last_num)
    num = num / 10
    break if num == 0
  end

  digit_array.reverse!
end

p rm -rdigit_list(1234)
