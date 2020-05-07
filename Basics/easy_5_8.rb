# easy_5_8.rb

=begin
input: an array of integers between 0 and 19
output: an array of those integers based on english words for each numbers
rules: alphabetize the array based on english words

create a hash with key = integer, value = word
  create empty hash
    (0..19).each do |int|
      hash[int] = ''
    end

array.sort_by do |num|
  hash[num]
end

=end
=begin
def alphabetic_number_sort(arr)

  num_hash = Hash.new('')
  num_array = ['zero', 'one', 'two', 'three', 'four', 'five',
                'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
                'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

  (0..19).each do |int|
    num_hash[int] = num_array[int]
  end

  sorted_arr = arr.sort_by do |num|
    num_hash[num]
  end
  sorted_arr
end
=end
NUMBERS = ['zero', 'one', 'two', 'three', 'four', 'five',
              'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
              'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
def alphabetic_number_sort(arr)
  sorted_array = arr.sort do |a, b|
    NUMBERS[a] <=> NUMBERS[b]
  end
  sorted_array
end



p alphabetic_number_sort([1, 2, 3])
p alphabetic_number_sort([19])
p alphabetic_number_sort([0])
p alphabetic_number_sort([11, 19, 4])
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
