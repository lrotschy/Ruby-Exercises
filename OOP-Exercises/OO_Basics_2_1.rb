# OO_Basics_2_1.rb

class Cat

def self.generic_greeting
  puts "Hello! I'm a cat!"
end

end


Cat.generic_greeting
felix = Cat.new
felix.class.generic_greeting #felix.class returns Cat
# felix.generic_greeting
