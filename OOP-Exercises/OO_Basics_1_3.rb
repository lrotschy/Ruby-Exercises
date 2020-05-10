# OO_Basics_1_3.rb
#also 1_4, 1_5
# Create an empty class named Cat.
# Using the code from the previous exercise, create an instance of Cat and assign it to a variable named kitty.



class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Kitteh')
