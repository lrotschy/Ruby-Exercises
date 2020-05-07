# easy_3_9.rb

=begin
input: a string
output: true or false if string is palindrome. method should ignore case and non-alphanumeric characters

  string.downcase
  iterate through string and delete any non-alphanumeric characters
    create an array of letters and numbers
    for each char in string, delete unless array.include?(char)
  string == string.reverse
=end
=begin
def palindrome?(string)
  characters = []
  ('0'..'9').each { |x| characters.push(x)}
  ('a'..'z').each { |y| characters.push(y)}

  new_string = ''

  for i in 0..string.length-1
    characters.include?(string.downcase[i]) ? new_string << string.downcase[i] : next
  end

  p new_string
  new_string == new_string.reverse

end
=end

=begin
def palindrome?(string)
  string = string.downcase.gsub(/[^a-z0-9]/, '')
  string == string.reverse
end
=end

def palindrome?(string)
  string = string.downcase.delete ("^a-z0-9")#"^a-z0-9"#"^a-z", "^0-9"
  string == string.reverse
end

p palindrome?('madam') #== true
p palindrome?('Madam') # == true
p palindrome?("madam i'm adam") # == true
p palindrome?('356653') #== true
p palindrome?('baloney') # == false
