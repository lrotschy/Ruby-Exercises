# advanced_12_3.rb
# input: matrix (array of arrays)
# output: new matrix that is transposed--all first column are now first row, etc.
#
#
# create a new matrix: new matrix = []
# find number of arrays in matrix -- matrix.length
# find number of items in each nested matrix -- matrix[0].length
#
# create a nested array in new matrix for each column:
# for 0..matrix[0].length - 1 (the number of items in each inner array)
#   matrix.push([])
#
# populate each nested array in new matrix with column items at each index
# for 0..length-1 do n
#   new_matrix[n].push(array[n][0])

# def transpose(matrix)
#   new_matrix = []
#
#   (0..(matrix[0].length - 1)).each do |x|
#     new_matrix.push([])
#   end
#
#   (0..(matrix.length - 1)).each do |y|
#     (0..(matrix.length - 1)).each do |z|
#       new_matrix[y].push(matrix[z][y])
#     end
#   end
#
#   new_matrix
# end
#
#
#
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
# p transpose(matrix)
#
# new_matrix = transpose(matrix)
# #
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
#
#
# swap
# 01 = 10
# 02 = 20

# def transpose!(matrix)
# #   # (0..(matrix.length-1)).each do |x|
# #   #   (0..(matrix.length-1)).each do |y|
# #
#   x = 0
#   y = 0
#   loop do
#     break if x == matrix.length
#       loop do
#         break if y == matrix.length
#         # matrix[x][y], matrix[y][x] = matrix[y][x], matrix[x][y]
#           matrix[x][y] = matrix[y][x]
#         p matrix
#         y += 1
#       end
#     x += 1
#   end
# end

# def transpose!(matrix)
#   matrix.size.times do |x|
#     (matrix.size - x).times do |y|
#       matrix[x][y + x], matrix[y + x][x] = matrix[y + x][x], matrix[x][y + x]
#     end
#   end
#   matrix
# end



# def transpose!(matrix)
#   matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
#   matrix
# end

# def transpose!(matrix)
#   indices = (0..matrix.length-1).to_a
#   index_combos = indices.combination(2).to_a
#   index_combos.each do |x, y|
#     matrix[x][y], matrix[y][x] = matrix[y][x], matrix[x][y]
#   end
#   matrix
# end

def transpose!(matrix)
  indices = (0..matrix.length-1).to_a
  indices.combination(2).each do |x, y|
    matrix[x][y], matrix[y][x] = matrix[y][x], matrix[x][y]
  end
  matrix
end

p matrix
p transpose!(matrix)
p matrix


# input: matrix i.e. array of arrays
# output: new matrix, rotated 90 degrees
# all inner array 0 element become first inner array.
# all inner array 1 elements become second array,
# etc.

# inner array length = new number of inner arrays
# number of inner arrays = new number of inner array elements

# new_matrix = []
# add to new_matrix inner array length number of empty arrays (1..n) push to new matrix []

# 0..number of inner arrays - 1 |inner_array|
#   0..length of inner arrays - 1 |index|
#     new_matrix[index][inner-array] << matrix[innerarry][index]

# return new_matrix

def transpose(matrix)
  p new_matrix_array_num = matrix[0].length
  p new_matrix_array_length = matrix.length

  new_matrix = []
  (1..new_matrix_array_num).each { |x| new_matrix << [] }

   (0.upto(new_matrix_array_num - 1)).each do |old_index|
      ((matrix.length - 1).downto(0)).each do |old_array|
        new_matrix[old_index] << matrix[old_array][old_index]
    end
  end
  new_matrix
end


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

p new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

matrix2 = [[1, 2, 3, 4],
          [5, 6, 7, 8]]

p transpose(matrix2)

matrix3 = [[1]]
p transpose(matrix3)
