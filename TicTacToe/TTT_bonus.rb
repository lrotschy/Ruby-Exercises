# TTT_bonus.rb

require 'pry'
require 'pry-byebug'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = '0'
FIRST_PLAYER = 'Choose' # 'Player', 'Computer', 'Choose'
WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
                  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
                  [1, 5, 9], [7, 5, 3]]             # diagonals

def joinor(array, mark = ', ', end_word = 'or')
  if array.length <= 1
    array.join
  elsif array.length == 2
    array.join(" #{end_word} ")
  elsif array.length > 2
    new_array = array[0..-2].map { |item| item.to_s + mark }
    new_array.push("#{end_word} ")
    new_array.push(array[-1])
    new_array.join('')
  end
end

def prompt(string)
  puts "==> #{string}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  prompt "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ".....|.....|....."
  puts "..#{brd[1]}..|..#{brd[2]}..|..#{brd[3]}.."
  puts ".....|.....|....."
  puts "-----+-----+-----"
  puts ".....|.....|....."
  puts "..#{brd[4]}..|..#{brd[5]}..|..#{brd[6]}.."
  puts ".....|.....|....."
  puts "-----+-----+-----"
  puts ".....|.....|....."
  puts "..#{brd[7]}..|..#{brd[8]}..|..#{brd[9]}.."
  puts ".....|.....|....."
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  board = {}
  (1..9).each { |n| board[n] = ' ' }
  board
end

def empty_spaces(brd)
  brd.keys.select { |key| brd[key] == INITIAL_MARKER }
end

def player_move!(brd)
  puts ''
  prompt "Your move!"
  move = ''
  loop do
    prompt "Enter the square you want to mark: #{joinor(empty_spaces(brd))}"
    move = gets.chomp
    break if empty_spaces(brd).include?(move.to_i)
    prompt "Sorry, but that is not a valid choice. Try again."
  end
  brd[move.to_i] = PLAYER_MARKER
end

def find_risky_square(brd, mark)
  risky_square = nil
  WINNING_COMBOS.each do |array|
    if brd.values_at(*array).count(mark) == 2
      array.each { |n| risky_square = n if brd[n] == ' ' }
    end
  end
  risky_square
end

def best_move(brd)
  if find_risky_square(brd, COMPUTER_MARKER)
    find_risky_square(brd, COMPUTER_MARKER)
  elsif find_risky_square(brd, PLAYER_MARKER)
    find_risky_square(brd, PLAYER_MARKER)
  elsif brd[5] == ' '
    5
  else
    empty_spaces(brd).sample
  end
end

def computer_move!(brd)
  puts ''
  prompt "Computer's turn!"
  brd[best_move(brd)] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_spaces(brd) == []
end

def win?(brd)
  !!winner(brd)
end

def winner(brd)
  WINNING_COMBOS.each do |array|
    if array.all? { |n| brd[n] == PLAYER_MARKER }
      return 'Player'
    elsif array.all? { |n| brd[n] == COMPUTER_MARKER }
      return 'Computer'
    end
  end
  nil
end

def place_piece!(brd, current_player)
  if current_player == 'Player'
    player_move!(brd)
  elsif current_player == 'Computer'
    computer_move!(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'Player'
    'Computer'
  elsif current_player == 'Computer'
    'Player'
  end
end

# main game setup
system 'clear'
prompt "Welcome to Tic Tac Toe!"
prompt "The squares in the board are numbered like this:"
puts ''
example_board = {}
(1..9).each { |n| example_board[n] = n.to_s }
display_board(example_board)
puts ''
puts ''

loop do # ready to begin loop
  prompt "If you are ready to begin, press y"
  input = gets.chomp
  break if input == 'y'
end # end ready to begin loop

player_wins = 0
computer_wins = 0
ties = 0
current_player = ''
if FIRST_PLAYER == 'Choose'
  loop do
    prompt "If you would prefer to go first, type 'P'."
    prompt "If you would prefer that the computer go first, type 'C'"
    input = gets.chomp.upcase
    if input == 'C'
      current_player = 'Computer'
      break
    elsif input == 'P'
      current_player = 'Player'
      break
    else
      prompt "Sorry, that is not a valid reponse."
    end
  end
else
  current_player = FIRST_PLAYER
end

# main game loop
loop do # begin main game loop
  puts ''
  loop do # each match loop
    board = initialize_board

    loop do # moves loop
      puts ''
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if win?(board) || board_full?(board)
    end # end moves loop

    if win?(board)
      puts ''
      prompt "#{winner(board)} won!"
      winner(board) == 'Player' ? player_wins += 1 : computer_wins += 1
    else
      puts ''
      prompt "It's a tie!"
      ties += 1
    end

    puts ''
    prompt "Here is the updated score:"
    prompt "Player: #{player_wins}"
    prompt "Computer: #{computer_wins}"
    prompt "Ties: #{ties}"

    loop do
      prompt "Are you ready for the next round?"
      prompt "Press y to begin."
      input = gets.chomp.downcase
      break if input.start_with?('y')
    end

    if player_wins == 2
      prompt "You won the tournament!"
      break
    elsif computer_wins == 2
      prompt "The computer won the tournament!"
      break
    end
  end # end match loop

  answer = ''
  loop do # play again question loop
    prompt "Do you want to play again? (y/n)"
    answer = gets.chomp
    if answer.downcase == 'y' || answer.downcase == 'n'
      break
    else
      prompt "Huh? I didn't understand you."
    end
  end # end play again question loop

  if answer.downcase == 'n'
    prompt "Thank you for playing!"
    break
  elsif answer.downcase == 'y'
    system 'clear'
    prompt "Ok! Here we go again!"
  end
end # end main loop
