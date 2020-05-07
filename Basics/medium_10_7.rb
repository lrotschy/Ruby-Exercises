# easy_10_7.rb

# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
#
# input: string
# output: string with any number words converted to string of digits
#
# create hash with string keys and digit string values
# convert string to array string.split
# map
# if hash keys include word, word equals hash value
# return new.array.join(' ')
require 'pry'
require 'pry-byebug'

NUMBERS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(string)
  output = string.split.map do |word|
    if NUMBERS.keys.include?(word.downcase)
      word = NUMBERS[word]
    else
      word
    end
  end
  output.join(' ')
  # find_phone_number(output.join(' '))
end

# def find_phone_number(string)
#   phone_number_array = []
#   binding.pry
#   (0...string.length-7).each do |i|
#     if string.split[i..(i+6)].all? { |x| ('0'..'9').include?(x)}
#       phone_number_array << string.split[i..(i+9)]
#     end
#   end
#   phone_number_array
# end

# p find_phone_number('Please call me at 5 5 5 1 2 3 4. Thanks.')

p word_to_digit('Please call me at five five five one two three four. Thanks.') # == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
