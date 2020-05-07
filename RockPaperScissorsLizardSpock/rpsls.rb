# rpsls.rb
VALID_CHOICES = %w(rock paper scissors lizard spock)
shortcuts = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

def prompt(message)
  puts("=> #{message}")
end

wins = {
  'scissors' => ['paper', 'spock'],
  'paper' => ['rock', 'spock'],
  'rock' => ['lizard', 'scissors'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
}

loop do
  player_wins = 0
  computer_wins = 0

  loop do
    choice = ''

    loop do
      # prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      prompt("Choose one: r = rock, p = paper, sc = scissors, l = lizard, sp = spock")
      shortcut = gets.chomp.downcase
      choice = shortcuts[shortcut]

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That is not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    if wins[choice].include?(computer_choice)
      player_wins += 1
      prompt("You won!")
    elsif wins[computer_choice].include?(choice)
      computer_wins += 1
      prompt("The computer won!")
    else
      prompt("It's a tie!")
    end

    prompt("You: #{player_wins}")
    prompt("Computer: #{computer_wins}")

    if player_wins == 5
      prompt("You are the Grand Winner!")
      prompt("You won #{player_wins} matches, and the computer won #{computer_wins}.")
      break
    elsif computer_wins == 5
      prompt("The computer is the Grand Winner!")
      prompt("You won #{player_wins} matches, and the computer won #{computer_wins}.")
      break
    end
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
