# advanced_12_5.rb

# input: original matrix (original)
# output: new matrix (new) with 90 rotation to right
#
# x = number of inner arrays in new = num of elem in inner array of original
# y = number of elements in inner arry in new = num of inner arrays of original
#
# create new matrix with x inner arrays
# y-1 down to 0
#   new_inner = []
#      0 up to x - 1
#       new-inner push original[y][x]
#     end
#   new.push(new_inner)
# end


def rotate90(original_matrix)
  num_rows = original_matrix[0].length
  num_columns = original_matrix.length
  new_matrix = []

  (0..(num_rows - 1)).each do |row|
    inner_array = []
    (num_columns - 1).downto(0).each do |column|
      inner_array.push(original_matrix[column][row])
    end
    new_matrix.push(inner_array)
  end
  new_matrix
end

def rotate_degrees(matrix, num)
  case num
  when 90 then num = 1
  when 180 then num = 2
  when 270 then num = 3
  when 360 then num = 4
  end

  num.times do
    matrix = rotate90(matrix)
  end

  matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 #== [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 #== [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

p rotate_degrees(matrix2, 90)
p rotate_degrees(matrix2, 180)
p rotate_degrees(matrix2, 270)
p rotate_degrees(matrix2, 360)
