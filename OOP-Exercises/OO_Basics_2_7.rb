# OO_Basics_2_7.rb

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}"
  end

end

kitty = Cat.new('Sophie')
puts kitty
