# easy_3_7.rb

# oddities
# input: an array
# output: a new array containing every other element (those with even index numbers)
=begin
def oddities(array)
  new_array = []
  array.each_with_index { |x, index| new_array.push(x) if index.even? }
  new_array
end

def oddities(array)
  counter = 0
  new_array = []
  while counter < array.length
    new_array.push(array[counter])
    counter += 2
  end
  new_array
end
=end
def oddities(array)
  counter = 1
  new_array = []
  while counter < array.length
    new_array.push(array[counter])
    counter += 4
  end
  new_array
end

p oddities([2, 3, 4, 5, 6, 7, 8 , 9, 10])
p oddities(['abc', 'def', 'i', 'abc', 'pdq', 'idk', 'ttyl', 'wya'])
p oddities([123])
p oddities([])
=begin
def oddities(array) #this returns nil for the empty array instead of the empty array
  index = 0
  new_array = []
  for i in 0..array.length
    if index.even?
      new_array.push(array[index])
    else
      next
    end
    index += 1
  end
  new_array
end



# this one would be cool, but the method doesn't work in 2.5.1. Is this super old?
def oddities(array)
  array.select_with_index { |item, index| index.even? }
end
=end
def oddities(array)
  array.select { |x| array.index(x).odd? }
end

p oddities([2, 3, 4, 5, 6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])
