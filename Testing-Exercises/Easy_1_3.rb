# Easy_1_3.rb

def missing(array)
  new_array = []
  array[0].upto(array[-1]).each {|elem| new_array.push(elem)}
  # return_array = new_array.reject{ |x| array.include?(x)}
  return_array = new_array.select { |x| !array.include?(x)}
end

puts missing([1, 3])
puts missing([2, 5, 7,10])
