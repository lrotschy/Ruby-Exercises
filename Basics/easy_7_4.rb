# ruby easy_7_4.rb
#
# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.
#
# You may not use String#swapcase; write your own version of this method.
#
# input: a string
# output: a new string in which every uppercase letter is replaces by lowercase and vice versa. Other characters are unchanged.
# rules: no swapcase
# one or more words in string
#call .split and iterate over words in string
# new_string = word.chars.map do
# iterate over characters and map to new array: string.chars.map
#   if char is included in array of lowercase letters, uppercase
#   if char is included in array of uppercase letters, downcase
# then join new array
#
# def swapcase(string)
#   new_array = string.split.map do |word|
#     new_word = word.chars.map do |char|
#       if ('a'..'z').include?(char)
#         char.upcase
#       elsif ('A'..'Z').include?(char)
#         char.downcase
#       end
#     end
#     new_word.join
#   end
#   new_array.join(' ')
# end

def swapcase(string)
  new_str = string.chars.map do |char|
    if ('a'..'z').include?(char)
      char.upcase
    elsif ('A'..'Z').include?(char)
      char.downcase
    else
      char
    end
  end
    new_str.join
end
p swapcase('CamelCase') #== 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') # == 'tONIGHT ON xyz-tv'
