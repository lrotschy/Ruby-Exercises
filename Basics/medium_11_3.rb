# medium_11_3.rb

# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.
#
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.
#
# You may assume that the string will always contain at least one character.

# input: string
# output: hash with three entries: one is percentage of lowercase letters, one of uppercsae, and one of neither
#
#
# create hash with
# lowercase = 0
# uppercase = 0
# neither = 0
# string.chars to give us an array of characters
# iterate through characters
#  if lowercase range includes char, hash[lowercase] += 1
#  elsif [uppercase] ... += 1
#  else [neither] += 1
#
# return hash

def letter_percentages(string)
  hash = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  string.chars.each do |ch|
    if ('a'..'z').include?(ch)
      hash[:lowercase] += 1
    elsif ('A'..'Z').include?(ch)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
  hash.each do |key, value|
    hash[key] = (value.to_f / string.length) * 100
  end
end

# def letter_percentages(string)
#   hash = {
#     lowercase: ((string.count "a-z")/string.length.to_f) * 100,
#     uppercase: ((string.count "A-Z")/string.length.to_f) * 100,
#     neither: ((string.count ("\\^A-z"))/string.length.to_f) * 100,
#   }
# end


p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }
