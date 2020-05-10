# Medium_2.rb

# A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:
require 'pry'
require 'pry-byebug'

class FixedArray
attr_accessor :array

  def initialize(n)
    @array = Array.new(n)
  end

  def to_s
    "#{array}"
  end

  def to_a
    # p array
    array.clone
  end

  def []=(index, value)
    self[index]
    array[index] = value
  end

  def [](index)
    array.fetch(index)
  end
end

# binding.pry
puts "Set one"
fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5
puts ''
puts 'Set two'
fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]
puts ''
puts 'Set three'
fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]
puts ''
puts 'Set four'
fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]
puts ''
puts 'Set five'
fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
puts ''
puts 'Set six'
puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'
puts ''
puts 'Set seven'
begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
