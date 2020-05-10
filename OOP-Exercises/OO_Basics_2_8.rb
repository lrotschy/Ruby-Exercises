# OO_Basics_2_8.rb

class Person
  attr_accessor :name, :secret

# the initialize method is not necessary!
  # def initialize(name='',secret='')
  #   @name = name
  #   @secret = secret
  # end

end

noname = Person.new
noname.secret = "Vegan food is delicious. Wait a second--just hear me out."
puts noname.secret

# Also: "Room 25 the best album that's coming out"
