# ttt_5.rb
require 'pry'
require 'pry-byebug'
PLAYER_MARKER = 'XX'
COMPUTER_MARKER = '00'

TRASH_TALK = [
  "How 'bout them apples?",
  "Whatcha gonna do now, big shot?",
  "You think you're pretty smart, don't you?",
  "What up?",
  "You steppin' up?",
  "Whatchu got?",
  "Beat that!",
  "Betchu can't outsmart me!",
  "Thought you had me cornered, didn't you?",
  "Too bad you always finish second.",
  "Gonna beat you in your own house!",
  "You're doin' ok, kiddo. Keep ya head up!",
  "I'm not arrogant. I'm good.", # Barry Bonds
  "Get your popcorn ready, because I'm gonna put on a show.", # Terrell Owens
  "It ain't braggin' if you can back it up.", # Dizzy Dean
  "Float like a butterfly, sting like a bee...", # Muhammed Ali
  "You think it's over?"
]

SPACES = {
  '01' => [0, 0],
  '02' => [0, 1],
  '03' => [0, 2],
  '04' => [0, 3],
  '05' => [0, 4],
  '06' => [1, 0],
  '07' => [1, 1],
  '08' => [1, 2],
  '09' => [1, 3],
  '10' => [1, 4],
  '11' => [2, 0],
  '12' => [2, 1],
  '13' => [2, 2],
  '14' => [2, 3],
  '15' => [2, 4],
  '16' => [3, 0],
  '17' => [3, 1],
  '18' => [3, 2],
  '19' => [3, 3],
  '20' => [3, 4],
  '21' => [4, 0],
  '22' => [4, 1],
  '23' => [4, 2],
  '24' => [4, 3],
  '25' => [4, 4]
}

empty_board = [[], [], [], [], []]

def initialize_board(hash, array)
  hash.each do |key, value|
    array[value[0]][value[1]] = key
  end
  array
end

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/MethodLength
def display_board(brd)
  puts "---------------------------------------------"
  puts "        |        |        |        |        |"
  puts "   #{brd[0][0]}   +   #{brd[0][1]}   +   #{brd[0][2]}   +   #{brd[0][3]}   +   #{brd[0][4]}   "
  puts "        |        |        |        |        |"
  puts "---------------------------------------------"
  puts "        |        |        |        |        |"
  puts "   #{brd[1][0]}   +   #{brd[1][1]}   +   #{brd[1][2]}   +   #{brd[1][3]}   +   #{brd[1][4]}   "
  puts "        |        |        |        |        |"
  puts "---------------------------------------------"
  puts "        |        |        |        |        |"
  puts "   #{brd[2][0]}   +   #{brd[2][1]}   +   #{brd[2][2]}   +   #{brd[2][3]}   +   #{brd[2][4]}   "
  puts "        |        |        |        |        |"
  puts "---------------------------------------------"
  puts "        |        |        |        |        |"
  puts "   #{brd[3][0]}   +   #{brd[3][1]}   +   #{brd[3][2]}   +   #{brd[3][3]}   +   #{brd[3][4]}   "
  puts "        |        |        |        |        |"
  puts "---------------------------------------------"
  puts "        |        |        |        |        |"
  puts "   #{brd[4][0]}   +   #{brd[4][1]}   +   #{brd[4][2]}   +   #{brd[4][3]}   +   #{brd[4][4]}   "
  puts "        |        |        |        |        |"
  puts "---------------------------------------------"
end
# rubocop:enable Metrics/AbcSize/Metrics/LineLength
# rubocop:enable Metrics/LineLength
# rubocop:enable Metrics/MethodLength

def prompt(string)
  puts "==> #{string}"
end

def make_move(move, brd, mark)
  brd[SPACES[move][0]][SPACES[move][1]] = mark
end

def vertical_win?(brd, mark)
  (0..4).any? do |inner_index|
    (0..4).all? do |outer_index|
      brd[outer_index][inner_index] == mark
    end
  end
end

def horizontal_win?(brd, mark)
  brd.any? do |inner_array|
    (0..4).all? { |x| inner_array[x] == mark }
  end
end

def diagonal_win1?(brd, mark)
  (0..4).all? { |x| brd[x][x] == mark }
end

def diagonal_win2?(brd, mark)
  (0..4).all? do |x|
    y = 4 - x
    brd[x][y] == mark
  end
end

def win?(brd, mark)
  vertical_win?(brd, mark) ||
    horizontal_win?(brd, mark) ||
    diagonal_win1?(brd, mark) ||
    diagonal_win2?(brd, mark)
end

def empty_spaces(brd)
  empty_choices = brd.map do |inner_array|
    inner_array.select do |element|
      (element != PLAYER_MARKER) && (element != COMPUTER_MARKER)
    end
  end
  empty_choices.flatten
end

def choice(brd)
  empty_spaces(brd).sample
end

def full?(brd)
  empty_spaces(brd) == []
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

def alternate_mark(mark)
  if mark == PLAYER_MARKER
    COMPUTER_MARKER
  elsif mark == COMPUTER_MARKER
    PLAYER_MARKER
  end
end

def horizontal_strategy(brd, mark, num)
  row = nil
  (0..4).any? do |outer_index|
    if brd[outer_index].count(mark) == num &&
       brd[outer_index].count(alternate_mark(mark)) == 0
      row = outer_index
    end
  end
  if !row.nil?
    brd[row].select { |x| x != PLAYER_MARKER && x != COMPUTER_MARKER }.sample
  end
end

def find_strategic_column(brd, mark, num)
  strategic_column = nil
  (0..4).each do |inner|
    if (0..4).map { |outer| brd[outer][inner] }.count(mark) == num &&
       (0..4).map { |outer| brd[outer][inner] }.count(alternate_mark(mark)) == 0
      strategic_column = inner
    end
  end
  strategic_column
end

def vertical_strategy(brd, mark, num)
  strategic_column = find_strategic_column(brd, mark, num)
  if !strategic_column.nil?
    array = (0..4).map { |outer| brd[outer][strategic_column] }
    array.select { |x| x != PLAYER_MARKER && x != COMPUTER_MARKER }.sample
  end
end

def diagonal_strategy1(brd, mark, num)
  count_array = (0..4).map { |x| brd[x][x] }
  if count_array.count(mark) == num &&
     count_array.count(alternate_mark(mark)) == 0
    count_array.select { |x| x != COMPUTER_MARKER && x != PLAYER_MARKER }.sample
  end
end

def diagonal_strategy2(brd, mark, num)
  count_ary = (0..4).map do |x|
    y = 4 - x
    brd[x][y]
  end
  if count_ary.count(mark) == num && count_ary.count(alternate_mark(mark)) == 0
    count_ary.select { |x| x != COMPUTER_MARKER && x != PLAYER_MARKER }.sample
  end
end

def strategic_move(brd, mark, num)
  strategic_move = nil
  a = horizontal_strategy(brd, mark, num)
  b = vertical_strategy(brd, mark, num)
  c = diagonal_strategy1(brd, mark, num)
  d = diagonal_strategy2(brd, mark, num)

  [a, b, c, d].each do |method|
    strategic_move = method if !method.nil?
  end
  strategic_move
end

def best_move(brd)
  move = nil
  num = 4
  loop do
    move = strategic_move(brd, COMPUTER_MARKER, num)
    break if !move.nil?
    move = strategic_move(brd, PLAYER_MARKER, num)
    break if !move.nil?
    num -= 1
    break if num == 1
  end
  move
end

def talk_trash(toggle = 'on')
  if toggle == 'on'
    take_out_the_trash = TRASH_TALK.shuffle
    prompt take_out_the_trash.pop
  end
end

def computer_move(brd)
  prompt "Computer's move:"
  move = best_move(brd)

  if move.nil?
    if empty_spaces(brd).include?('13')
      make_move('13', brd, COMPUTER_MARKER)
    else
      make_move(choice(brd), brd, COMPUTER_MARKER)
    end
  else
    make_move(move, brd, COMPUTER_MARKER)
  end
end

def player_move(brd)
  prompt "Player's move:"
  move = ''
  loop do
    move = gets.chomp
    if empty_spaces(brd).include?(move)
      make_move(move, brd, PLAYER_MARKER)
      break
    else
      prompt "That space is not available. Choose a different spot:"
    end
  end
end

def choose_difficulty(difficulty)
  difficulty_easy = [true, false, false, false, false]
  difficulty_medium = [true, false, false, false]

  if difficulty == 'e'
    difficulty_easy.sample
  elsif difficulty == 'm'
    difficulty_medium.sample
  else
    true
  end
end

def move_with_random_mistakes(difficulty, brd)
  value = choose_difficulty(difficulty)
  p value
  if value == true
    computer_move(brd)
  elsif value == false
    make_move(choice(brd), brd, COMPUTER_MARKER)
  end
end

def execute_turn(player, brd, toggle, difficulty)
  if player == 'Player'
    player_move(brd)
  elsif player == 'Computer'
    move_with_random_mistakes(difficulty, brd)
    talk_trash(toggle)
  end
end

# main game setup
prompt "Welcome to 5 x 5 Tic Tac Toe"
prompt "You will be marking spaces with an X."
prompt "The computer will mark spaces with an 0."
prompt "To choose a space, enter the number you wish to mark."
prompt "Trash talk is on. If you wish to turn it off, type 'off'."
prompt "Otherwise, hit any key to begin."
input = gets.chomp.downcase
toggle = 'on'
toggle = 'off' if input == 'off'
prompt "Choose your difficulty level: (e)asy, (m)edium, (d)ifficult"
difficulty = gets.chomp.downcase

loop do # main loop
  prompt "Let's begin!"
  current_player = 'Player'
  game_board = initialize_board(SPACES, empty_board)
  loop do # main game loop
    display_board(game_board)
    execute_turn(current_player, game_board, toggle, difficulty)
    current_player = alternate_player(current_player)
    puts ''
    break if win?(game_board, PLAYER_MARKER) ||
             win?(game_board, COMPUTER_MARKER) ||
             full?(game_board)
  end

  display_board(game_board)
  if win?(game_board, PLAYER_MARKER)
    prompt "You won!"
  elsif win?(game_board, COMPUTER_MARKER)
    prompt "The computer won!"
  elsif full?(game_board)
    prompt "It's a tie!"
  end

  response = ''
  loop do # play again loop
    prompt "Do you want to play again? ('y'/'n')"
    response = gets.chomp.downcase
    if response == 'n' || response == 'y'
      break
    else
      prompt "I'm sorry, but that is not a valid response."
      prompt "Please type 'y' or 'n'."
    end
  end

  if response.start_with?('y')
    prompt "Here we go again!"
    puts '--------------------------------'
  elsif response.start_with?('n')
    prompt "Good bye! Thank you for playing!"
    break
  end
end # main loop
