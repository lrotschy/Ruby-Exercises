# easy_7_5.rb

# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

# input: a string
# output: a new string with every other character capitalized, remaining are lowercase
# characters that are not letters should not be changed, but count when switching
#
# new_string = ''
# iterate through characters, each with index
#   if index is even?
#     if (a-z) includes char, capitalize  and concat to new string
#     else char and concat to new string
#   elsif index is odd?
#     if (A-Z)include? cchar
#       char lowercase and concat to new string
#     else char and concat to new string
#   end
# end
# new string

# def staggered_case(string)
#   new_string = ''
#
#   string.chars.each_with_index do |char, index|
#     if index.even?
#       if ('a'..'z').include?(char)
#         new_string << char.upcase
#       else
#         new_string << char
#       end
#     elsif index.odd?
#       if ('A'..'Z').include?(char)
#         new_string << char.downcase
#       else
#         new_string << char
#       end
#     end
#   end
#   new_string
# end

# def staggered_case(string)
#   new_string = ''
#
#   string.chars.each_with_index do |char, index|
#     if index.even? && ('a'..'z').include?(char)
#       new_string << char.upcase
#     elsif index.odd? && ('A'..'Z').include?(char)
#       new_string << char.downcase
#     else
#       new_string << char
#     end
#   end
#   new_string
# end
#
def staggered_case(string)
  new = ''
  string.chars.each_with_index do |char, index|
    index.even? ? new << char.upcase : new << char.downcase
  end
  new
end

# def staggered_case(string)
#   new = ''
#   string.downcase.chars.each_with_index do |ch, idx|
#     idx.even? ? new << ch.upcase : new << ch
#   end
#   new
# end

p staggered_case('I Love Launch School!') #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') #== 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 NuMbErS'
