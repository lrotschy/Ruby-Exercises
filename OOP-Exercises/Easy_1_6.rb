# Easy_1_6.rb

class Flight

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
