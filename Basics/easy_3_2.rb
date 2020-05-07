# easy_3_2.rb

=begin
input: get two numbers from user. no need to validate.
output: 6 sentences expressing the result of the following operations on the two numbers:
+, -, *, /, %, **
=end

num1 = ''
loop do
puts "==> Enter the first number:"
num1 = gets.chomp
  if num1.to_i.to_s == num1
    num1= num1.to_f
    break
  else
    puts "Please enter a number."
  end
end

num2 = ''
loop do
puts "==> Enter the second number:"
num2 = gets.chomp
  if num2.to_i.to_s == num2
    num2 = num2.to_f
    break
  else
    puts "Please enter a number."
  end
end


puts "==> #{num1} + #{num2} = #{num1 + num2}"
puts "==> #{num1} - #{num2} = #{num1 - num2}"
puts "==> #{num1} * #{num2} = #{num1 * num2}"
puts "==> #{num1} / #{num2} = #{num1 / num2}" rescue puts "Can't divide by zero"
puts "==> #{num1} % #{num2} = #{num1 % num2}" rescue puts "Can't divide by zero"
puts "==> #{num1} ** #{num2} = #{num1 ** num2}"

=begin
operations = [:+, :-, :*, :/, :%, :**]

operations.each do |op|
  puts "==> #{num1} #{op} #{num2} = #{num1.send(op, num2)}"
end
=end
