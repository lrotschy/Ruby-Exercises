# OO_Basics_3_7.rb

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color

# Cat, then Animal would be checked to find #color. It would stop there because it found what it was looking for.
