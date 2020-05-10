# OO_Basics_4_5.rb

class Person
  protected
  attr_reader :age

  public
  attr_writer :age

  def older_than?(other)
    age > other.age
  end
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)
