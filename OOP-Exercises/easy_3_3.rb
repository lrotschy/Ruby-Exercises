# easy_3_3.rb

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

henry = AngryCat.new('1', 'Henry')
polly = AngryCat.new('6', 'Polly')
