# easy_8_3.rb
# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.
#
# input: string
# output: list of substrings starting at beginning of string
# arrange in order from shortest to longest
#
# init empty array
# counter = 0
# loop
#   array.push(string[0..counter])
#   counter+= 1
#   break if counter == string.length
# end
# array

def substrings_at_start(string)
  array = []
  counter = 0
  loop do
    array.push(string.slice(0..counter))
    counter += 1
    break if counter == string.length
  end
  array
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
