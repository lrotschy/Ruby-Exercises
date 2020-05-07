# easy_7_3.rb
# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# input: string iwth one or more words, delimited by spaces
# output: same string, but with each word capitalized

# create array of words -- string.split
# iterate through words and call capitalize method on each
# map to new array_of_str -- string.split.map do |word|
# return new_array.join(' ')
# use each and push to new string after calling capitalize
# return new string

# iterate thorugh letters in each word
#   if letter is a letter, not a symbol, and previous letter is not a letter, letter capitalize

def word_cap(string)
  string.split.map { |word| word.capitalize }
end

def word_cap(string)
  new_array = []

  string.split.each do |word|
    new_word = ''

    word.chars.each_with_index do |letter, index|
      if ('a'..'z').include?(letter)  && index == 0
        new_word << letter.capitalize!
      elsif ('a'..'z').include?(letter)  && ('A'..'z').include?(word.chars[index-1]) == false
        new_word << letter.capitalize!
      else
        new_word << letter
      end
    end

    new_array << new_word
  end
  new_array.join(' ')
end

p word_cap('four score and seven') #== 'Four Score And Seven'
p word_cap('the javaScript language') #== 'The Javascript Language'
p word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'
