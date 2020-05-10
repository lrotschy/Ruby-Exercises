# Easy_1_10.rb
class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

mary = Truck.new('Toyota', 'Tacoma', 'idk')
puts mary
luna = Car.new('Subaru', 'Impreza')
puts luna
bangbang = Motorcycle.new('Honda', 'Shadow')
puts bangbang