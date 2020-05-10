# OO_Basics_1_6.rb, 1_7, 1_8, 1_9

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Kitteh')
kitty.greet
kitty.name = "Luna"
kitty.greet

# Another way to write a getter method (less preferred):
# def name
#   @name
# end
# def name=(name)
#   @name = name
# end
