# Easy_2_4.rb

class Transform
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def uppercase
    data.upcase
  end

  def self.lowercase(string)
    string.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
