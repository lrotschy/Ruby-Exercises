# Easy_2_9.rb

def each_cons(collection)
  index = 0
  while index < collection.length - 1 do
    yield(collection[index], collection[index + 1])
    index += 1
  end
  # nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result #== nil
p hash #== { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash #== {}
p result #== nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash #== {'a' => 'b'}
p result #== nil
