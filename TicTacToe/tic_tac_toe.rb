# tic-tac-toe.rb

=begin

Tic-tac-toe is played on a 3 x 3 grid.
Players take turn marking a single square.
If a player gets three in a row vertically, horizontally, or diagonally, they win.
If the board is full an neither player has 3 in a row, it is a tie.

loop do

Display empty board
  loop
  Ask player 1 to mark board
  player 1 marks board
  display updated board
  if player 1 has three in a row, display win
  if the board is full and neither has three in a row, display tie
  change player
  end

play again?
yes, go to next iteration.
no, display "Good bye"
end

=end

=begin Thinking it through for myself before the videos
game_board =   [[-, -, -]
                [-, -, -]
                [-, -, -]]

def winning_conditions(mark)
  wins = [[0][0], ]
  array of sub arrays of sub arrays of winning combinations
  wins.all? { |combo| game_board[combo]}
end

START

puts game_board
puts "please indicate the square to mark by giving the x axis"
subarray_choice = gets.chomp.to_i
puts "now the y axis"
array_choice = gets.chomp.to_i

game_board[array_choice][subarray_choice] = x

puts game_board

if winning_conditions(x)
=end
require 'pry'
require 'pry-byebug'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = '0'

def prompt(string)
  puts "==> #{string}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  # system 'clear'
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
  prompt "Your move!"
  move = ''
  loop do
    prompt "Enter the square you want to mark: #{empty_spaces(brd).join(', ')}"
    move = gets.chomp
    break if empty_spaces(brd).include?(move.to_i)
    prompt "Sorry, but that is not a valid choice. Try again."
  end
  brd[move.to_i] = PLAYER_MARKER
end

def computer_move!(brd)
  prompt "Computer's turn!"
  move = empty_spaces(brd).sample
  brd[move] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_spaces(brd) == []
  # empty_square(brd).empty?
end

def win?(brd)
  !!winner(brd)
end
=begin
def winner(brd)
  winning_combos = [  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
                      [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
                      [1, 5, 9], [7, 5, 3]]             # diagonals

# My way of doing it:
  win_x = winning_combos.any? do |array|
      array.all? { |square| brd[square] == PLAYER_MARKER}
  end

  win_0 = winning_combos.any? do |array|
      array.all? { |square| brd[square] == COMPUTER_MARKER}
  end

  if win_x
    'Player'
  elsif win_0
    'Computer'
  else
    nil
  end

end
=end
=begin
# code in video:
def winner(brd)
  winning_combos = [  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
                      [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
                      [1, 5, 9], [7, 5, 3]]             # diagonals

  winning_combos.each do |array|
    if  brd[array[0]] == PLAYER_MARKER &&
        brd[array[1]] == PLAYER_MARKER &&
        brd[array[2]] == PLAYER_MARKER
      return 'Player'
    elsif   brd[array[0]] == COMPUTER_MARKER &&
            brd[array[1]] == COMPUTER_MARKER &&
            brd[array[2]] == COMPUTER_MARKER
      return 'Computer'
    else
      return nil
    end
  end
end
=end

# another option? gotta get that nil in the right place!

def winner(brd)
  winning_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
                    [1, 5, 9], [7, 5, 3]]             # diagonals
  winning_combos.each do |array|
    if array.all? { |n| brd[n] == PLAYER_MARKER }
      return 'Player'
    elsif array.all? { |n| brd[n] == COMPUTER_MARKER }
      return 'Computer'
    end
  end
  nil
end

# And... one more version ...
=begin
def winner(brd)
  winning_combos = [  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
                      [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
                      [1, 5, 9], [7, 5, 3]]             # diagonals
  winning_combos.each do |array|
    if brd.values_at(*array).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*array).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end
=end
# brd.values_at(*array) is equivalent to what is above in method.
# The splat operator passes in each of the values of array

# Main Game Loop
system 'clear'
prompt "Welcome to Tic Tac Toe!"
prompt "The squares in the board are numbered like this:"
puts ''
example_board = {}
(1..9).each { |n| example_board[n] = n.to_s }
display_board(example_board)
puts ''
puts ''
loop do
  prompt "If you are ready to begin, press y"
  input = gets.chomp
  if input == 'y'
    break
  end
end

puts ''
loop do
  board = initialize_board
  display_board(board)

  loop do
    puts ''
    player_move!(board)
    display_board(board)
    break if win?(board) || board_full?(board)
    puts ''
    computer_move!(board)
    display_board(board)
    break if win?(board) || board_full?(board)
  end

  if win?(board)
    prompt "#{winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  answer = ''
  loop do
    prompt "Do you want to play again? (y/n)"
    answer = gets.chomp
    if answer.downcase == 'y' || answer.downcase == 'n'
      break
    else
      prompt "Huh? I didn't understand you."
    end
  end

  if answer.downcase == 'n'
    prompt "Thank you for playing!"
    break
  elsif answer.downcase == 'y'
    system 'clear'
    prompt "Ok! Here we go again!"
  end
end
