# medium_4_4.rb

class Greeting

  def greet(string)
    puts string
  end
end

class Hello < Greeting
  def hi
    greet('hello')
  end
end

class Goodbye < Greeting
  def bye
    greet('Goodbye')
  end
end 
