# easy_8_7.rb

# Write a method that takes a string, and returns a new string in which every character is doubled.
#
# input: string
# output: string with each character doubled
#
# new_str = ''
# string.chars each do |char|
#   concat to new_str twice
# end
# new_str

def repeater(string)
  new_string = ''
  string.chars.each do |char|
    new_string << char << char
  end
  new_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
