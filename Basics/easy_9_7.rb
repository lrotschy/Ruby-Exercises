# easy_9_7.rb

# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

# input: first name last name --string
# output: last name, first name -- string
#
# split string into words
# use string interpolation to build new string using indices from string split

def swap_name(name)
  #"#{name.split[1]}, #{name.split[0]}"
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
