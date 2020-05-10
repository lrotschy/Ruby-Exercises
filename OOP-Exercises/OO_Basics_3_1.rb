# OO_Basics_3_1.rb 3_2 3_3

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
    start_engine
  end

  def start_engine
    puts "Ready to go!"
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'long')
puts truck1.year
puts truck1.bed_type

car1 = Car.new(2006)
puts car1.year
