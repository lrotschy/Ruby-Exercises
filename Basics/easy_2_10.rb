# easy_2_9.rb

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

#I think both will be upcased because the object that are referenced by the array index should be the same.

# this could get you in trouble if you were trying to create a new array using the same values but then change one of them while still keeping a copy of the original. I think you can avoid it by duplicating the objects and passing the duplicated version to the new array.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = Marshal.load(Marshal.dump(array1))
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
