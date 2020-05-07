# easy_3_8.rb

# palindrome part 1
# input: a string
# output: true or false. true if string is exactly the same backwards and forwards. spaces and capitals count.

=begin
def palindrome?(string)
  string == string.reverse
end
=end


=begin
get length.
-1 to -length push to new array
check to see if they are equal.
=end

=begin works for arrays but not strings
def palindrome?(array)
  new_array = []
  for i in (1..array.length) do
    new_array.push(array[-i])
  end
  array == new_array
end
=end

=begin this works for arrays but not strings
def palindrome?(array)
values_array = array.map do |x|
  counter = 0
  reverse_counter = -1
  iteration_value = array[counter] == array[reverse_counter]
  counter += 1
  reverse_counter -= 1
  iteration_value
end
values_array.all? { |x| x == true }
end

=end

# this one works for both and doesn't use if statements
def palindrome?(str_or_arr)
  values_array = []
  counter = 0
  reverse_counter = -1
  for i in (1..str_or_arr.length)
    iteration_value = str_or_arr[counter] == str_or_arr[reverse_counter]
    values_array.push(iteration_value)
    counter += 1
    reverse_counter -= 1
  end
  values_array.all? { |x| x == true }
end


p palindrome?('madam') #== true
p palindrome?('Madam') #== false          # (case matters)
p palindrome?("madam i'm adam") #== false # (all characters matter)
p palindrome?('356653') #== true
p palindrome?([1, 2, 3, 3, 2, 1])
p palindrome?([1, 2, 3, 4, 5, 6])
