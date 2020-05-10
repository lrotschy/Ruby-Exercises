# easy_3_6.rb

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

# You could use the @age variable.

kitteh = Cat.new('calico')
kitteh.make_one_year_older
p kitteh.age
