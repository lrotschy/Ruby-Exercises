# Easy_1_9.rb

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
  def to_s
    "My #{self.class} #{@name} is #{@age} years old and has #{@color} fur."
  end
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end
end

class Dog < Pet
  def initialize(name, age, breed)
    super(name, age)
    @breed = breed
  end
end
pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
b = Dog.new('B', 13, 'corgi')
puts b
#
# The only problem I can think of that would result from moving the color parameter into the Pet class and removing the initialize method from Cat is that you might have colorless pets. Not sure how that would work.
