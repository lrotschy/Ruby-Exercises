# Advanced_1.rb



fac_enumerator = Enumerator.new do |y|
  accumulator = 1
  index = 0
  loop do
    index += 1
    accumulator *= index
    y << accumulator
  end
end

p fac_enumerator.take(7).each { |n| puts n}

7.times {puts fac_enumerator.next}

puts fac_enumerator.next
fac_enumerator.rewind
puts fac_enumerator.next
fac_enumerator.rewind
p fac_enumerator

fac_enumerator.each_with_index do |elem, index|
  puts fac_enumerator.next
  break if index > 6
end
