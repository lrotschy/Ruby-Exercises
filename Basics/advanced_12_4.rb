# advanced_12_4.rb

def transpose(matrix)
  new_matrix = []

  (0..(matrix[0].length - 1)).each do |x|
    new_matrix.push([])
  end

  (0..(matrix[0].length - 1)).each do |y|
    (0..(matrix.length - 1)).each do |z|
      new_matrix[y].push(matrix[z][y])
    end
  end

  new_matrix
end

p transpose([[1, 2, 3, 4]]) #== [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
