# twenty_one.rb
ACES = ['Ace of Hearts', 'Ace of Spades', 'Ace of Diamonds', 'Ace of Clubs']
WINNING_SCORE = 21
STAY_SCORE = 17
def prompt(string)
  puts "==> #{string}"
end

# rubocop:disable Metrics/MethodLength
def initialize_deck(deck)
  (2..10).each do |x|
    deck["#{x} of Hearts"] = [x, 'available']
    deck["#{x} of Diamonds"] = [x, 'available']
    deck["#{x} of Clubs"] = [x, 'available']
    deck["#{x} of Spades"] = [x, 'available']
  end

  ['Jack', 'Queen', 'King'].each do |x|
    deck["#{x} of hearts"] = [10, 'available']
    deck["#{x} of Diamonds"] = [10, 'available']
    deck["#{x} of Clubs"] = [10, 'available']
    deck["#{x} of Spades"] = [10, 'available']
  end

  deck['Ace of Hearts'] = [nil, 'available']
  deck['Ace of Diamonds'] = [nil, 'available']
  deck['Ace of Clubs'] = [nil, 'available']
  deck['Ace of Spades'] = [nil, 'available']
end
# rubocop:enable Metrics/MethodLength

def deal(hand, dk)
  2.times { hit(hand, dk) }
  hand
end

def total(hand, dk)
  hand.map { |card| dk[card][0] }.inject(:+)
end

def hit(hand, dk)
  card = dk.select { |_, value| value[1] == 'available' }.keys.sample
  dk[card][0] = ace_value(hand, dk) if ACES.include?(card)
  dk[card][1] = 'used'
  hand.push(card)
  card
end

def ace_value(hand, dk)
  if hand.empty?
    11
  elsif total(hand, dk) > 10
    1
  else
    11
  end
end

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

def bust?(hand, dk)
  true if total(hand, dk) > WINNING_SCORE
end

def determine_winner(dealer_total, player_total, winner)
  if winner == ''
    if (WINNING_SCORE - dealer_total) < (WINNING_SCORE - player_total)
      'Dealer'
    elsif (WINNING_SCORE - dealer_total) > (WINNING_SCORE - player_total)
      'Player'
    else
      'tie'
    end
  else
    winner
  end
end

def declare_round_winner(winner)
  case winner
  when 'Player' then prompt "You won!"
  when 'Dealer' then prompt "Dealer won!"
  when 'tie'    then prompt "It's a tie!"
  end
end

def declare_tourney_winner(dealer_wins, player_wins)
  if dealer_wins == 5
    prompt "Dealer won the tournament!"
  elsif player_wins == 5
    prompt "You won the tournament!"
  end
end

# main game Loop
puts ''
prompt "Welcome to Twenty-One!"
prompt "The computer will be the dealer."
prompt "We will play 5 rounds. Whoever wins the majority wins the tournament."

loop do # tournament loop
  prompt "Let's begin!"
  puts ''

  deck = {}
  initialize_deck(deck)

  player_wins = 0
  dealer_wins = 0
  ties = 0

  loop do # main game loop
    player_hand = []
    deal(player_hand, deck)

    dealer_hand = []
    deal(dealer_hand, deck)

    prompt "Player's cards: #{joinor(player_hand, ', ', 'and')}"
    prompt "Dealer's cards: #{dealer_hand[0]} and not shown"

    winner = ''

    loop do # player's turn loop
      player_total = total(player_hand, deck)
      puts ''
      prompt "Your hand total is #{player_total}"
      if bust?(player_hand, deck)
        prompt "Bust"
        winner = 'Dealer'
        break
      end

      prompt "Do you want to (h)it or (s)tay?"
      input = gets.chomp.downcase
      if input.start_with?('h')
        prompt "You got #{hit(player_hand, deck)}"
        puts ''
        prompt "Player's cards: #{joinor(player_hand, ', ', 'and')}"
      elsif input.start_with?('s')
        break
      else
        prompt "Sorry, but that is not a valid command."
      end
    end # end player loop

    if winner == ''
      puts '--------------------------------'
      prompt "Dealer's turn!"
      prompt "Hit any key when you are ready."
      gets
    end

    loop do # dealer's turn loop
      puts '--------------------------------'
      break if winner == "Dealer"
      dealer_score = total(dealer_hand, deck)
      puts ''
      prompt "Dealer's cards: #{joinor(dealer_hand, ', ', 'and')}"
      prompt "Dealer's total is #{dealer_score}"
      puts ''

      if dealer_score > WINNING_SCORE
        prompt "Dealer busts"
        winner = 'Player'
        break
      elsif dealer_score >= STAY_SCORE
        prompt "Dealer stays"
        break
      elsif dealer_score < STAY_SCORE
        prompt "Hit dealer"
        prompt "Dealer got #{hit(dealer_hand, deck)}"
      end
    end # end dealer turn loop

    puts ''
    player_total = total(player_hand, deck)
    dealer_total = total(dealer_hand, deck)
    winner = determine_winner(dealer_total, player_total, winner)
    declare_round_winner(winner)

    if winner == 'Dealer'
      dealer_wins += 1
    elsif winner == 'Player'
      player_wins += 1
    else
      ties += 1
    end

    puts '--------------------------------'
    prompt "Dealer wins: #{dealer_wins}"
    prompt "Player wins: #{player_wins}"
    prompt "Ties: #{ties}"
    break if player_wins == 5 || dealer_wins == 5

    puts '--------------------------------'
    puts "Next Round!"
    puts '--------------------------------'
  end # end game Loop

  declare_tourney_winner(dealer_wins, player_wins)
  prompt "Do you want to play again? ('y'/'n')"
  response = gets.chomp.downcase
  if response.start_with?('y')
    prompt "Here we go again!"
    puts '--------------------------------'
  else
    break
  end
end # end tournament loop
prompt "Good-bye and thank you for playing!"
