# OO_Basics_2_2.rb 2_3 2_4 2_5

class Cat
  attr_accessor :name
  @@total = 0

  def initialize(name)
    @name = name
    @@total += 1
  end

  def rename(name)
    self.name = name # when modifying a value using a setter method we must use `self` to avoid init local variable
  end

  def identify
    self   # I used self.to_s, but it wasn't necessary
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{name}"
  end

  def self.total
    @@total
  end

end

# kitty = Cat.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name
# p kitty.identify # p calls inspect, so we get instance variables and values
# Cat.generic_greeting
# kitty.personal_greeting

kitty1 = Cat.new('bob')
kitty2 = Cat.new('henry')
p Cat.total
