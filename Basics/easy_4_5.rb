# easy_4_5.rb

=begin
input: a number
output: the sum of all the multiples of 5 between 1 and the number
assume an integer greater than 1

range each do if x % 5 == 0 push to new array
new array inject :+

=end

def multisum(num)
  array_of_5s = []
  (1..num).each { |n| array_of_5s.push(n) if n % 5 == 0 || n % 3 == 0 }
  array_of_5s.inject(:+)

end
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
