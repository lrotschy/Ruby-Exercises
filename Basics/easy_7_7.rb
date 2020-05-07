# easy_7_7.rb

# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.
#
# input: array of integers
# output: print result, rounded to 3 decimal places of
# array multiplied together, divided by number of items
# rules: assume array is non-empty
#
# array.inject(:*) / init result, iterate through array, result *= each item
# divide result by array.length
# use kernel format method to round to three places / .round(3) / or roundabout by converting to string and back

def show_multiplicative_average(array)
   result = (array.inject(:*).to_f / array.length)
   puts "The result is #{'%.3f' % result}"
end



show_multiplicative_average([3, 5])
#The result is 7.500

show_multiplicative_average([6])
#The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
#The result is 28361.667
