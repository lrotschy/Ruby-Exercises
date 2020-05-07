# 2_4.rb

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)  # will delete 2, at index 1
puts numbers

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)  # will delete the item 1, not the index
puts numbers

names_for_my_dog = ['Brooke', 'B', 'B-Bey', 'Brookie']
names_for_my_dog.delete('Brooke')
puts names_for_my_dog
names_for_my_dog.delete_at(2)
puts names_for_my_dog
