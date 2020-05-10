# Easy_2_2.rb

def zip(array1, array2)
  new_array = []
  (0..(array1.length-1)).each do |index|
    new_array << [array1[index], array2[index]]
  end
  new_array
end

p zip([1, 2, 3], [4, 5, 6])
