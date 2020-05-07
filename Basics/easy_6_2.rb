# easy_6_2.rb

# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.
#
# input: an array of strings
# output: an array of strings that are the same as input but with vowels removed
# new_array = iterate through strings array.map do |word|
#   create empty string
#   word.chars.each do |ch|
#     create vowels array with both upper and lowercase vowels
#     if vowels.include?(ch) == false, concat ch to empty string
#   end
# string

VOWELS = %w(a e i o u A E I O U)
# def remove_vowels(array_of_str)
#   new_array = array_of_str.map do |word|
#     new_str = ''
#     word.chars.each { |ch| new_str << ch if VOWELS.include?(ch) == false }
#     new_str
#   end
#   new_array
# end

# def remove_vowels(array)
#   array.map { |string| string.delete('aeiouAEIOU')}
# end

def remove_vowels(array)
  array.map do |string|
    string.each_char { |ch| string.delete!(ch) if VOWELS.include?(ch) }
  end
end

def remove_vowels(array)
  array.each do |string|
    string.gsub!(/[aeiouAEIOU]/, '')
  end
end 
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #  == ['BC', '', 'XYZ']
p remove_vowels([])
p remove_vowels([""])
