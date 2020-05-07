# 3_8.rb

advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.slice(0..38)
p advice.slice(0...advice.index('house'))
p advice.slice(0, advice.index('house'))
puts advice

#Deletes the portion specified in the argument from the original string and returns the deleted portion in a new string.
p advice.slice!(0..38)
p advice
