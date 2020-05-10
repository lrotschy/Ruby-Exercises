# easy_3_1.rb 3_2

class Greeting
  def greet(message)
    puts message
  end
  #add this to fix case 5
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# case 1:

hello = Hello.new
p hello.hi
# puts 'Hello'

# case 2:

hello = Hello.new
p hello.bye
# throws NoMethodError

# case 3:

hello = Hello.new
p hello.greet
# throws Argument error

# case 4:

hello = Hello.new
hello.greet("Goodbye")
# puts "Goodbye"

# case 5:

Hello.hi
# throws NoMethodError
