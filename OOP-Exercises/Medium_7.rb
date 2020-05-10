# Medium_7.rb

class GuessingGame
  attr_accessor :target, :guesses_left, :guess, :low, :high

  def initialize(low, high)
    @low = low
    @high = high
    @target = rand(low..high)
    @guesses_left = nil
    @guess = nil
  end

  def compute_guesses
    size_of_range = high - low
    @guesses_left = Math.log2(size_of_range).to_i + 1
  end

  def play
    compute_guesses
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
      puts "Enter a number between #{low} and #{high}:"
      self.guess = gets.chomp
      break if valid_guess
      puts "Sorry, but that guess is invalid."
    end
  end

  def valid_guess
    guess.to_i.to_s == guess && guess.to_i <= high && guess.to_i >= low
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

game = GuessingGame.new(25, 59)
game.play
