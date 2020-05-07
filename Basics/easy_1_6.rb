# easy_1_6.rb

=begin
input: string with one or more words. spaces if more than one word.
output: string with words in the same order but letters reversed in each word over 5 characters.
what should we return if string is empty?

START
Split the string using spaces--nil argument on split
check each word in split string array.
  if it is over 5 characters, reverse!
join the split string array adding a space between each item
END
=end


def reverse_words(string)
  string.split.each { |word| word.reverse! if word.length >= 5 }.join(' ')
end

#test cases
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
puts reverse_words('')
