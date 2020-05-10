# medium_4_7.rb

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

# I would change it to `information` because it is going to be redundant when called: 'Light.light_information'
