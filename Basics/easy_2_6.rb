# easy_2_6.rb

# no input
# output: all odd numbers 1..99 inclusive on separate lines

=begin
START
iterate through numbers-- for i in 1..99
puts i if i.odd?
end
END
=end

=begin
for i in 1..99
  puts i if i.odd?
end

counter = 1
while counter < 100
  puts counter
  counter += 2
end

1.upto(99) { |n| puts n if n % 2 == 1}


array = Array.new(99) { |n| n += 1}
p array
array.each { |n| puts n if n.odd?}


Array.new(99) { |n| n += 1}.each { |x| puts x if x.odd?}
=end
puts (1..99).select { |x| x.odd?}

puts (1..99).select(&:odd?) #this is cool
(1..99).each { |n| puts n if n.odd?}
