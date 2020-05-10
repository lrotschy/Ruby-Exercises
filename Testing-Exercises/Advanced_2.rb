
# Group 1
puts "Group 1"
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc # This is a .
puts my_proc.class # Proc
my_proc.call # This is a .
my_proc.call('cat') # This is a cat.
return_value = my_proc.call
p return_value # nil
puts ""
return_value = my_proc.call('cat')
p return_value# nil
puts 'my_proc2'
my_proc2 = proc { |n| n * 2 }
return_value = my_proc2.call(1)
p return_value # 2

my_proc3 = Proc.new {|n| n * 10 }
puts my_proc3.call(3)
# Group 2
puts "Group 2"
puts "my_lambda"
my_lambda = lambda { |thing| puts "This is a #{thing}." }
puts "my_second_lambda"
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda # id
puts my_second_lambda # id
puts my_lambda.class # Proc
my_lambda.call('dog') # This is a dog
return_value = my_lambda.call('corgi')
p return_value # nil
# my_lambda.call # argument error
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # uninitialized constant Lambda NameError
puts 'my_lambda2'
my_lambda2 = -> (n) { n * 2 }
return_value = my_lambda2.call(1)
p return_value # 2

# Group 3
puts "Group 3"
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
return_value = block_method_1('seal') { |seal| puts "This is a #{seal}."}
p return_value
# block_method_1('seal') # Local JumpError

# Group 4
puts "Group 4"
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
return_value = block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}

block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# block_method_2('turtle') { puts "This is a #{animal}."} # undefined variable
# puts block_method_2.class # error
