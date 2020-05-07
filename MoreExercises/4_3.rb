# 4_3.rb

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    #the purpose of this line is to choose only those dividends that divide evenly into the number
    dividend -= 1
  end until dividend == 0
  divisors # the purpose is to return the array of divisors
end
puts factors(10)

puts ''

def factors(number)
  divisors = []

  (1..number).each do |num|
    if number % num == 0
      divisors.push(num)
    end

  end
 divisors
end

puts factors(10)

# now use a while loop
puts ''
def factors(number)
  divisors = []
  dividend = number
  while dividend > 0
    divisors.push(dividend) if number % dividend == 0
    dividend = dividend - 1
  end
  divisors
end
puts factors(10)
