# medium_11_4.rb
#
# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
#
# move all '(' || ')' to new array
# if new array [0] == ')' return false
# elsif number of ( != number of ) return false
# elsif array -1 == '(' return false
# else true

# def balanced?(string)
#   new_string = ''
#   string.chars.each do |ch|
#     if ch == '(' || ch ==')'
#       new_string.concat(ch)
#     end
#   end
#   if new_string[0] == ')'
#     false
#   elsif new_string[-1] == '('
#     false
#   elsif new_string.count('(') != new_string.count(')')
#     false
#   else
#     true
#   end
# end

def balanced?(string)
  sum = 0
  string.chars.each do |ch|
    if ch == '('
      sum += 1
    elsif ch == ')'
      sum -= 1
    end
    break if sum < 0
  end
  sum.zero?
end

p balanced?('What (is this?') #== false
p balanced?('((What) (is this))?') #== true
p balanced?('((What)) (is this))?') #== false
p balanced?('Hey!') #== true
p balanced?(')Hey!(') #== false
p balanced?('What ((is))) up(') #== false
#
# def balanced?(string, a, b)
#   new_string = ''
#   string.chars.each do |ch|
#     if ch == a || ch == b
#       new_string.concat(ch)
#     end
#   end
#   if new_string[0] == b
#     false
#   elsif new_string[-1] == a
#     false
#   elsif new_string.count(a) != new_string.count(b)
#     false
#   else
#     true
#   end
# end
#
# p balanced?('What is) this?', '(', ')') #== false
# p balanced?('What (is this?', '(', ')') #== false
# p balanced?('((What) (is this))?', '(', ')') #== true
# p balanced?('((What)) (is this))?', '(', ')') #== false
# p balanced?('Hey!', '(', ')') #== true
# p balanced?(')Hey!(', '(', ')') #== false
# p balanced?('What ((is))) up(', '(', ')') #== false
