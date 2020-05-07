# easy_1_4.rb

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
  array.each_with_object ({}) do |type, hash|
    hash[type] = array.count(type)
  end
end

puts count_occurrences(vehicles)


def count_types(array)
  # hash = {} (this doesn't work without the lines I have commented out below. Hash needs a default value.)
  hash = Hash.new(0)
  #x = 0
  #array.each { |type| hash[type] = x }
  array.each { |type| hash[type] += 1 }
  hash
end

puts count_types(vehicles)

=begin
to use array.length to count:
iterate over array
create an array with the name of hte element unless there already is one. Add the element to the array with its name.
if there already is one, push the element to it.
create a hash with the array name as the key and the array length as the value.

Below doesn't count right. I don't think I'm naming the arrays the way I want to. And element will always be an array, so that doens't work either.

=end

=begin

def count_it(array)

array.each do |element|
  if element.is_a?(Array) == false
    "#{element}" = []
    "#{element}".push(element)
  elsif element.is_a?(Array)
    "#{element}".push(element)
  end

end
hash = {}

array.each do |element|
  hash[element] = "#{element}".length
end

hash

end

puts count_it(vehicles)
=end
