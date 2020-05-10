# Easy_2_6.rb

def each_with_index(array)
  index = 0
  (0..(array.length - 1)).each do |idx|
    yield(array[idx], idx)
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

def each_with_index(array)
  index = 0
  while index < array.length
    yield(array[index], index)
    index += 1
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
