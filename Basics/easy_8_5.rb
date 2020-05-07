# easy_8_5.rb
# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.
#
# You may (and should) use the substrings method you wrote in the previous exercise.
#
# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

# input: a string
# output: a list of all substrings that are palindromes
# rules:
# palindromes should be arranged in same sequence as substrings
# duplicates should appear multiple times
# use substrings method
# case counts
# single characters don't count
#
# algorithm
# generate substrings using substrings method
#iterate through substrings and select string == string.reverse && length > 1


def substrings(string)
  new_array = []
  string.chars.each_with_index do |__, index|
    counter = index
    loop do
      new_array.push(string[index..counter])
      counter += 1
      break if counter == string.length
    end
  end
  new_array
end

# def palindromes(string)
#   substrings(string).select do |str|
#     str.length > 1 && str == str.reverse
#   end
# end

 # modify to ignore case and non-alphanumeric characters:
 #   new_substrings = map our substrings
 #      init new string
 #        each substring.chars
 #          if ('A'..'z').include?(char) or ('0'..'9')include?(char) concat to new string
 #          return new string.downcase!
 #  palindromes on each new_substrings

#  def remove_chars_from_substrings(string)
#    new_substrings = substrings(string).map do |str|
#      new_str = ''
#      str.chars.each do |char|
#        new_str << char.downcase if ('A'..'z').include?(char || ('0'..'9').include?(char))
#      end
#    end
# end

def remove_chars_from_substrings(string)
  new_substrings = substrings(string).map do |str|
    str.gsub!(/^A-z0-9/, '')
  end 
end

def palindromes(string)
  remove_chars_from_substrings(string)
  substrings(string).select do |str|
    str.length > 1 && str == str.reverse
  end
end


p palindromes('abcd55dcba?') #== []
p palindromes('Madam') #== ['madam', 'ada']
p palindromes('hello-Madam-did-madam-goodbye') #== [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') #== [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
