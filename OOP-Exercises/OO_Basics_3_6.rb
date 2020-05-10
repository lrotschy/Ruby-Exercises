# OO_Basics_3_5.rb 3_6

module Towable # must put this first so Truck can find it
  def tow
    puts "I can tow a trailer!"
  end
end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end



truck1 = Truck.new(1994)
truck1.tow
puts truck1.year

car1 = Car.new(2006)
puts car1.year
