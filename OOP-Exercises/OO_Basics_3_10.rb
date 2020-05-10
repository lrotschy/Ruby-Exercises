# OO_Basics_3_10.rb

module Transportation

  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end

end

big_yellow = Transportation::Truck.new
herbie = Transportation::Car.new

# Namespacing: modules can group similar classes to make purpose clear and help avoid problems of same name in classes
