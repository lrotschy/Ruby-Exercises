# OO_Basics_3_4.rb

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + " Go #{speed} please!"  # Include parens because super doesn't accept any arguments
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')
