# medium_11_8.rb
#
# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).
#
# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.
#
# input: integer
# output: integer --next highest
#   odd number
#   multiple of 7
#   digits occur once each
#   error message if there is no next highest
#
#   create loop
#   add one to number on each Iteration
#   if n >= 9_999_999_999 return error mesage
#   if n odd? %7==0 and n.digits == n.digits.uniq return n

# def featured(n)
# return_value = nil
#   loop do
#     n += 1
#     if n >= 987654321
#       return_value = "There is no next featured number."
#       break
#     elsif (n.odd?) && (n % 7 == 0) && (n.digits == n.digits.uniq)
#       return_value = n
#       break
#     end
#   end
# return_value
# end

def featured(n)
  n += 1 until n.odd? && n % 7 == 0
  loop do
    n += 14
    return "There is no next featured number." if n >= 9876543210
    return n if (n.odd?) && (n % 7 == 0) && (n.digits == n.digits.uniq)
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) #== 1_023_456_987
p featured(9_999_999_999)
