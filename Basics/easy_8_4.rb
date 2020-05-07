# easy_8_4.rb

# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.
#
# You may (and should) use the substrings_at_start method you wrote in the previous exercise:

# input: string
# output: all substrings of string in order, starting a 0 index by length, 1 index by length, etc.
#
# new_array = []
# iterate through string each with index
# for each elem,
#   counter = index
#   loop
#   push string[index..counter] to new array
#   counter += 1
#   break if counter == string.length
# end
# end
# new_array

# def substrings(string)
#   new_array = []
#   string.chars.each_with_index do |__, index|
#     counter = index
#     loop do
#       new_array.push(string[index..counter])
#       counter += 1
#       break if counter == string.length
#     end
#   end
#   new_array
# end


def substrings_at_start(string)
  array = []
  counter = 0
  loop do
    array.push(string[0..counter])
    counter += 1
    break if counter == string.length
  end
  array
end

# p substrings_at_start('abc') == ['a', 'ab', 'abc']
# p substrings_at_start('a') == ['a']
# p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def substrings(string)
  new_array = []
  (0..string.length - 1).each do |num|
    current = string[num..-1]
    new_array << substrings_at_start(current)
  end
  new_array.flatten
end
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
