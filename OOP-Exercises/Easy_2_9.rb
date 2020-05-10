# Easy_2_9.rb
module Moveable
  def walk
    puts "#{self} #{gait} forward."
  end
end

class LivingThing
  include Moveable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end
end

class Noble < LivingThing
  def initialize(name, title)
    super(name)
    @title = title
  end

  def gait
    'saunters'
  end

  def to_s
    "#{@title} #{@name}"
  end
end

class Person < LivingThing

  private

  def gait
    "strolls"
  end
end

class Cat < LivingThing

  private

  def gait
    "saunters"
  end
end

class Cheetah < LivingThing


  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"
byron = Noble.new('Byron', 'Lord')
byron.walk
