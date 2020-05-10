# OO_Basics_3_8.rb

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
# cat1.color
p Cat.ancestors

# Cat, Animal, Object, Kernel, Basic Object. No method is found, so it searches all the way up the inheritance chain.
