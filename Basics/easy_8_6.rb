# easy_8_6.rb

# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".
#
# input: two numbers, one is starting, one is ending (do we assume first is smaller than last?)
# output: all the numbers between start and end, if number is div/3 print 'Fizz', if div/5 print 'Buzz', if div by 3 and 5 print 'FizzBuzz'
#
# range starting..end each do
#   case num
#   when num %3 == 0 and num % 5 == 0
#     print fizzbuzz
#   when num%3 == 0
#     print fizz
#   when num%5 == 0
#     print buxx
#   else
#     print num
#   end

def fizzbuzz(start, last)
  array = (start..last).map do |num|
    if (num % 3 == 0 && num % 5 == 0)
      'FizzBuzz'
    elsif (num % 3 == 0)
      'Fizz'
    elsif (num % 5 == 0)
      'Buzz'
    else
      num.to_s 
    end
  end
  puts array.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
