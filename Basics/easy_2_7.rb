# easy_2_7.rb

# no input
# output: even numbers 1..99 inclusive (not sure what that means in this case) on separate lines

for i in 1..99
  puts i if i.even?
end

(1..99).each { |x| puts x if x.even?}

counter = 1
loop do
  break if counter >= 99
  puts counter if counter.even?
  counter +=1
end
