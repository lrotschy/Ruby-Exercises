# easy_5_5.rb

=begin
input: a string consisting of letters and other characters (or just one or the other?)
output: the string with non-alphabetic characters replaced with a space
rules: if two or more non-alphabetic characters appear in a row, there should only be one space


=end
require 'pry'
require 'pry-byebug'
def cleanup(string)
  #binding.pry
  string.chars.each do |ch|
    if ('a'..'z').include?(ch) == false
      string.gsub!(ch, ' ')
    end
  end
  string.chars.join('')
  string.squeeze
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup(";aslk_???") == " aslk "

def cleanup(string)
  string.gsub!(/[^a-z]/, ' ').squeeze
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup(";aslk_???") == " aslk "

def cleanup(string)
  #
  string.chars.each do |ch|
    if ('a'..'z').include?(ch) == false
      string.gsub!(ch, ' ')
    end
  end
  new = []
  string.chars.each_with_index do |ch, index|
    if index == 0 || !(ch == ' ' && string.chars[index - 1] == ' ')
      new.push(ch)
    end
  end
  new.join('')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup(";aslk_???") == " aslk "
