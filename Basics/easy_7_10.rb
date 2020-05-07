# ruby easy_7_10.rb

# Write a method that returns the next to last word in the String passed to it as an argument.
#
# Words are any sequence of non-blank characters.
#
# You may assume that the input String will always contain at least two words.
#
# input: a string with at least two characters
# output: the next to last word in the string
#
# method: return string.split[-2]
# break string into an array of words, select second to last by index


# def penultimate(string)
#   string.split[-2]
# end
#
#
# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'
#
# further exploration
# input: a string consisting of 0 or more words
# output: the middle word
# edge cases: empty string, one word string, even numbered string, 'word' that is not alphabetic--include or not?
#
# algorithm:

# for odd number of words:
# # length = string.split.length
# # middle = length / 2
# for even number of words:
# middle = middle and middle - 1
# for non-alphabetic
#   new words = words.select word
#     word.chars.any? ('A'..'z').include?(char)
#   call middle on new_words


# def middle(string)
#     new_words = string.split.select do |word|
#       word.chars.any? {|char| ('A'..'z').include?(char)}
#     end
#
#   middle_index = new_words.length / 2
#   if string == ''
#     nil
#   elsif new_words.length.odd?
#     new_words[middle_index]
#   else
#     [new_words[middle_index - 1], new_words[middle_index]]
#   end
# end


p middle('')
p middle('one')
p middle('two three')
p middle('three four five')
p middle('five six 7 eight')
p middle('six, seven, 8, nine, ten')
p middle('     ')
