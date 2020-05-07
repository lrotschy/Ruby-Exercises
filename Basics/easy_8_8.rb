# easy_8_8.rb


# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.
#
# input: string
# output: a new string in which all alphabetic characters except vowels are doubled. Nothing else is doubled
#
#
#
# Add to previous method inside block to concat twice if alphabet include? char and not vowels include? char
# otherwise, concat once

def double_consonants(string)
  new_string = ''
  string.chars.each do |char|
    if ('A'..'z').include?(char) && !(%w(A E I O U a e i o u).include?(char))
      new_string << char << char
    else
      new_string << char
    end
  end
  new_string
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
