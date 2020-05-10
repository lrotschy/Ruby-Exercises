# easy_3_4.rb

class Cat
  def initialize(type)
    @type = type
  end
  def to_s
    "I am a #{@type} cat."
  end
end


kitten = Cat.new('tabby')
puts kitten
