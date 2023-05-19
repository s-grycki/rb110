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

=begin
def hit_me(sum)
  card = (FACE_VALUES + NAMED_VALUES.keys).sample
  sum += (FACE_VALUES + NAMED_VALUES.values).sample
  sum = change_ace_value(sum) if (sum > 21 && card == 'Ace')
end

def change_ace_value(sum)
  sum -= 10
end
=end

require 'pry'
require 'pry-byebug'

# constant variables
FACE_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10]
NAMED_VALUES = { 'Jack' => 10, 'King' => 10, 'Queen' => 10, 'Ace' => 11 }
SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
PLAYERS = ['Dealer', 'Player']
FULL_SUIT = FACE_VALUES + NAMED_VALUES.keys

def prompt(msg)
  puts ">> #{msg}"
end

def clear_screen
  ((system "cls") | (system "clear")) # multiple OS support
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

def correct_ace_value(value)
  value << -10 if value.sum > 21
end

def display_hands(hand, seen_card)
  prompt("Dealer has the #{seen_card[0]} of #{seen_card[1]} and ?")
  prompt("===================")
  hand.each { |card| prompt("You have the #{card[0]} of #{card[1]}") }
  prompt("===================")
end

def display_value(value)
  prompt("Your hand has a value of #{value}")
end

def player_turn(hand, value, full_deck, seen_card)
  loop do
    answer = hit_or_stay(hand, value, seen_card)
    clear_screen
    break if answer == 's'
    answer == 'h' ? hit_me!(hand, value, full_deck) : prompt('Invalid input')
    correct_ace_value(value) if over_and_ace?(hand[-1][0], value.sum)
    break busted(value, PLAYERS[0], PLAYERS[1]) if busted?(value)
  end
end

def hit_or_stay(hand, value, seen_card)
  display_hands(hand, seen_card)
  display_value(value.sum)
  prompt('Would you like to hit or stay?')
  gets.chomp.chr.downcase
end

def hit_me!(hand, value, full_deck)
  draw_card!(hand, full_deck)
  add_value!(hand, value)
end

def over_and_ace?(hand, value)
  hand == 'Ace' && value > 21
end

def busted(value, winner, loser)
  prompt("#{loser} has a value of #{value.sum}")
  prompt("#{loser}'s hand is over 21")
  prompt("#{winner} wins")
end

def busted?(value)
  value.sum > 21
end

def dealer_turn(hand, value, full_deck)
  loop do
    value.sum < 17 ? draw_card!(hand, full_deck) : return
    add_value!(hand, value)
    correct_ace_value(value) if over_and_ace?(hand[-1][0], value.sum)
    break busted(value, PLAYERS[1], PLAYERS[0]) if busted?(value)
  end
end

def higher_value(values)
  values.flat_map(&:sum)
end

def display_winner(amounts)
  prompt("Dealer hand has a value of #{amounts[0]}")
  prompt("Your hand has a value of #{amounts[1]}")
  if amounts[0] > amounts[1]
    prompt('Dealer wins')
  elsif amounts[1] > amounts[0]
    prompt('Player wins')
  else
    prompt("It's a draw")
  end
end

# main loop
loop do
  # local variables. 0 indexes are dealer. 1 indexes are player
  full_deck = initialize_deck
  values = [[], []]
  hands = [[], []]

  initial_hand(hands[0], values[0], full_deck)
  initial_hand(hands[1], values[1], full_deck)

  # in case 2 aces are drawn in an initial hand
  values.each do |value|
    correct_ace_value(value) if values.any? { |val| val.sum > 21 }
  end

  seen_card = hands[0].sample
  # display_hands(hands[1], values[1].sum, seen_card)
  player_turn(hands[1], values[1], full_deck, seen_card)
  dealer_turn(hands[0], values[0], full_deck) unless busted?(values[1])
  if !busted?(values[0]) && !busted?(values[1])
    amounts = higher_value(values)
    display_winner(amounts)
  end

  prompt('Would you like to play again? (y/n)')
  answer = gets.chomp.chr.downcase
  break unless answer == 'y'
  clear_screen
end

prompt('Thank you for playing. Good bye!')