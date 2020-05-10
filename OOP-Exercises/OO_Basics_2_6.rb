# OO_Basics_2_6.rb

class Cat
COLORS = ['brown', 'gray', 'black', 'tabby', 'calico', 'white']

  def initialize(name)
    @name = name
    @color = COLORS.sample
  end

  def greet
    puts "Hello! My name is #{@name} and I'm a #{@color} cat!"
  end
end

kitty = Cat.new('Linus')
kitty.greet
