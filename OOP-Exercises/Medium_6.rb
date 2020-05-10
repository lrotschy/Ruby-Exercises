# Medium_6.rb

class GuessingGame
  attr_accessor :target, :guesses_left, :guess
  TARGET_VALUE = 10
  def initialize
    @target = rand(TARGET_VALUE)
    @guesses_left = 7
    @guess = nil
  end

  def play
    loop do
      puts "You have #{guesses_left} remaining."
      get_guess
      self.guess = self.guess.to_i
      self.guesses_left -= 1
      break if correct_guess? || guesses_left == 0
      print_clue
    end
    display_ending_message
  end

  def get_guess
    loop do
      puts "Enter a number between 1 and #{TARGET_VALUE}:"
      self.guess = gets.chomp
      break if valid_guess
      puts "Sorry, but that guess is invalid."
    end
  end

  def valid_guess
    guess.to_i.to_s == guess && guess.to_i <= TARGET_VALUE && guess.to_i >= 1
  end

  def correct_guess?
    guess == target
  end

  def display_ending_message
    if guess.to_i == target
      puts "That is correct!"
      puts "You won!"
    else
      puts "You lost!"
    end
  end

  def print_clue
    if guess < target
      puts "Your guess is too low."
    elsif guess > target
      puts "Your guess is too high."
    end
  end
end

game = GuessingGame.new
game.play
