=begin
Problem: Create the game 21. There are 52 cards in a deck consisting of
4-suits with 13 values(2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).
There is a player and a dealer. They are both dealt two cards. The purpose
is to get as close to 21 as possible without going over, otherwise it's a
bust and the player loses. The player can see one of the dealer's cards.
The player can hit as many times as desired and their turn ends when
they choose to stay. The dealer must then hit until their total is at
least 17. If the dealer busts, then the player wins. Otherwise,
the highest sum value wins

-Input: 'Hit'/'Stay'
-Output: New card if 'hit', change turn or compare if 'stay'

-Rules:
-If either player or dealer goes over 21, they lose
-dealer must hit until they have at least 17
-ace can be worth 11 or 1 depending on sum of hand relative to 21
-jack, queen, and king are each worth 10
-other cards are their face value

Examples:
Dealer has: Ace and unknown card
You have: 2 and 8
=> Player should 'hit' because there's no way to bust

Dealer has: 7 and unknown card
You have: 10 and 7
=> Player should 'stay' because player will most likely win or draw

Dealer has: 5 and unknown card
You have: Jack and 6
=> Player should probably 'stay' and hope that the dealer busts

Data Structures:
Hashes, Arrays, Integers, Strings

Algorithm:
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

=end

require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')

# constant variables
FACE_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10]
NAMED_VALUES = { 'Jack' => 10, 'King' => 10, 'Queen' => 10, 'Ace' => 11 }
FULL_SUIT = FACE_VALUES + NAMED_VALUES.keys
SUITS = ['Clubs ♣', 'Diamonds ♦', 'Hearts ♥', 'Spades ♠']
PLAYERS = ['Dealer', 'Player']
ROUNDS = 5
TARGET = 21
DEALER_MAX = TARGET - 4

def prompt(msg)
  puts ">> #{msg}"
end

def clear_screen
  ((system "cls") | (system "clear")) # multiple OS support
end

def divide_screen
  prompt(MESSAGES['dividers'])
end

def initialize_deck
  SUITS.each_with_object([]) do |suit, arr|
    FULL_SUIT.each { |card| arr << [card, suit] }
  end
end

def initial_hand(hand, value, full_deck)
  2.times do
    draw_card!(hand, full_deck)
    add_value!(hand, value)
  end
end

def draw_card!(hand, full_deck)
  hand << full_deck.delete(full_deck.sample)
end

def add_value!(hand, value)
  value << if NAMED_VALUES.key?(hand[-1][0])
             NAMED_VALUES[hand[-1][0]]
           else
             hand[-1][0]
           end
end

def two_aces(values)
  values.each do |value|
    correct_ace_value(value) if busted?(value)
  end
end

def correct_ace_value(value)
  value << -10 if value.sum > TARGET
end

def display_hands(hand, seen_card)
  prompt("Dealer has the #{seen_card[0]} of #{seen_card[1]} and ?")
  divide_screen
  hand.each { |card| prompt("You have the #{card[0]} of #{card[1]}") }
  divide_screen
end

def display_value(value)
  prompt("Your hand has a value of #{value}")
end

def player_turn(hand, value, full_deck, seen_card)
  loop do
    answer = hit_or_stay(hand, value, seen_card)
    clear_screen
    break if answer == 's'
    # rubocop:disable Layout/LineLength
    answer == 'h' ? hit_me!(hand, value, full_deck) : prompt(MESSAGES['invalid'])
    # rubocop:enable Layout/LineLength
    correct_ace_value(value) if over_and_ace?(hand[-1][0], value.sum)
    break busted(value, PLAYERS[0], PLAYERS[1]) if busted?(value)
  end
end

def hit_or_stay(hand, value, seen_card)
  display_hands(hand, seen_card)
  display_value(value.sum)
  prompt(MESSAGES['hit_stay?'])
  gets.chomp.chr.downcase
end

def hit_me!(hand, value, full_deck)
  draw_card!(hand, full_deck)
  add_value!(hand, value)
end

def over_and_ace?(hand, value)
  hand == 'Ace' && value > TARGET
end

def busted(value, winner, loser)
  prompt("#{loser} has a value of #{value.sum}")
  prompt("#{loser}'s hand is over #{TARGET}")
  prompt("#{winner} wins")
end

def busted?(value)
  value.sum > TARGET
end

def dealer_turn(hand, value, full_deck)
  loop do
    value.sum < DEALER_MAX ? draw_card!(hand, full_deck) : return
    add_value!(hand, value)
    correct_ace_value(value) if over_and_ace?(hand[-1][0], value.sum)
    break busted(value, PLAYERS[1], PLAYERS[0]) if busted?(value)
  end
end

def update_wins_busted!(values, wins)
  values[0].sum > values[1].sum ? wins['player'] += 1 : wins['dealer'] += 1
end

def display_hand_values(values)
  prompt("Dealer hand has a value of #{values[0].sum}")
  prompt("Your hand has a value of #{values[1].sum}")
end

def display_winner(values)
  if values[0].sum > values[1].sum
    prompt(MESSAGES['d_win'])
  elsif values[1].sum > values[0].sum
    prompt(MESSAGES['p_win'])
  else
    prompt(MESSAGES['draw'])
  end
end

def update_wins!(values, wins)
  if values[0].sum > values[1].sum
    wins['dealer'] += 1
  elsif values[1].sum > values[0].sum
    wins['player'] += 1
  end
end

def game_results(values, wins)
  if values.any? { |value| busted?(value) }
    update_wins_busted!(values, wins)
  else
    display_hand_values(values)
    display_winner(values)
    update_wins!(values, wins)
  end
end

def win_totals(wins)
  2.times do |idx|
    prompt("#{PLAYERS[idx]} has #{wins.values[idx]} wins")
  end
end

def someone_won?(wins)
  wins.value?(ROUNDS)
end

def play_again?
  prompt(MESSAGES['play_again?'])
  answer = gets.chomp.chr.downcase
  clear_screen
  answer == 'y'
end

# main loop
loop do
  wins = { 'dealer' => 0, 'player' => 0 }

  loop do
    # local variables. 0 indexes are dealer. 1 indexes are player
    full_deck = initialize_deck
    dealer_cards = []
    dealer_value = []
    player_cards = []
    player_value = []

    initial_hand(dealer_cards, dealer_value, full_deck)
    initial_hand(player_cards, player_value, full_deck)

    # in case 2 aces are drawn in an initial hand
    two_aces([dealer_value, player_value])

    seen_card = dealer_cards.sample
    player_turn(player_cards, player_value, full_deck, seen_card)
    # rubocop:disable Layout/LineLength
    dealer_turn(dealer_cards, dealer_value, full_deck) unless busted?(player_value)
    # rubocop:enable Layout/LineLength
    game_results([dealer_value, player_value], wins)
    divide_screen
    win_totals(wins)
    divide_screen
    # rubocop:disable Layout/LineLength
    break prompt("#{wins.key(ROUNDS)} wins #{ROUNDS} rounds") if someone_won?(wins)
    # rubocop:enable Layout/LineLength
  end

  break unless play_again?
end

prompt(MESSAGES['bye'])