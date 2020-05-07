# easy_1_9.rb

=begin
input = one argument, a positive integer
output = sum of digits in number

START
convert input to string, split
for each element in split array, convert to i
sum array
END

START
create empty array to sum
create divisor variable equal to input

loop do

  if divisor == 0
    break
    push divisor to array to sum
  end
  call divmod(10) on divisor and set to result variable
  result[0] = divisor
  result[1] = remainder
  push remainder to array to sum

end
=end

def sum(input)
  input.to_s.split(//).map { |n| n.to_i }.inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45



def sum2(input)
  array = []
  divisor = input

  loop do
    result = divisor.divmod(10)
    divisor = result[0]
    remainder = result[1]
    array.push(remainder)
    break if divisor == 0
  end
  array.inject(:+)
end

puts ''
puts sum2(23) == 5
puts sum2(496) == 19
puts sum2(123_456_789) == 45




def sum3(input)
  array = []
  divisor = input

  loop do
    result = divisor.divmod(10)
    divisor = result[0]
    array.push(result[1])
    break if divisor == 0
  end
  array.inject(:+)
end

puts ''
puts sum3(23) == 5
puts sum3(496) == 19
puts sum3(123_456_789) == 45

def sum4(input)
  input.digits.sum
end
puts ''
puts sum4(23) == 5
puts sum4(496) == 19
puts sum4(123_456_789) == 45
