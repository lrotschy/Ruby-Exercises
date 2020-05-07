# easy_9_2.rb

# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
#
# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.
#
# Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.

# input: an integer
# output: return the same number if it's a double number
# return the number * 2 if not
#
# find half
# conditional
# if if array[0..half -1] == array[half.. -1] (double number)
#   number
# else
#   number * 2
#
# double?
# num.digits to give array of digits
# array.length / 2 = index at first number past halfway point in array
# if array[0..half -1] == array[half.. -1]
#   then its double

def twice(int)
  half = int.digits.length / 2

  if int.digits[0..half - 1] == int.digits[half..-1] && int.digits.length > 1
    int
  else
    int * 2
  end
end



p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
p twice(1015101) 
