# easy_2_8.rb

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# This should print BOB BOB. the upcase! method is destructive, so it changed the actual value referenced by both of the variables. They are still pointing to the same place, but what is saved at that place has changed.
