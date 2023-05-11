=begin
ORIGINAL PEDAC PROCESS:

Problem:
Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn
and marks a square on the board. First player to reach 3 squares in a row,
including diagonals, wins. If all 9 squares are marked and no player has 3
squares in a row, then the game is a tie.

-Input: Square marked by user(x or o)
-Output: Tie if board full. Winner if 3 in a row.
Play again? if end of game. Board if still playing

-Rules:
-Player is character x and computer is character o
-Show updated board after each turn
-Display the winner if a certain letter has 3 in a row
-Display tie if board is full
-Ask user if they want to play again after each turn
-Handle bad input errors
-Don't allow marked squares to be overwritten

Example:

     |     |
  X  |  O  |  X
     |     |
-----|-----|-----
     |     |
     |  O  |
     |     |
-----|-----|-----
     |     |
     |     |
     |     |

Data Structures:
Strings, Arrays, Hashes

Algorithm:
Display empty board
Ask user to mark a square on 3x3 board
Have computer mark a square
Display updated board
If character has 3 in a row
  Display winner
Else if board is full
  Display tie
    Ask user if they want to play again
    - If yes
      - Loop back to beginning
    - Else
      - Output goodbye and end program
If board not full and no winner
  Display updated board
  Loop back to asking user for input

Code:
=end

=begin
BONUS FEATURES:

Feature 1: Joinor
  - Adds delimeneter between available elements
  - Adds final keyword before last element
Feature 2: Loop until 5 wins
  - Adds score count
  - Displays win total between rounds
  - Keeps going until someone has 5 wins
Feature 3: AI Defense
  - Checks if player is about to win
  - Marks final empty square if player has 2 in a row
Feature 4: AI Offense
  - Checks if computer is about to win
  - Marks final empty square if computer has 2 in a row
Feature 5: Computer turn refinements
  - Prioritizes offense over defense if computer can win
  - Computer picks space 5 first, if available
  - Allows user to decide who goes first
  - Allows compyter to choose who goes first
Feature 6: Improve the game loop
  - Makes main loop more terse by calling a single place_piece! method
  - Alternates current player so new method knows whose turn it is

EXTRAS:
Feature 1: Allows player to view rules on welcome screen
  - Enter rules or r to view the game rules
Feature 2: Multiple OS support for system clear
  - Makes the game more enjoyable for a wider audience
Feature 3: Allows for character switching
  - Gives player choice of being X or O each game
  - X by default
Feature 4: Timed character placement
  - Allows player the choice of timed placement for computer
  - If enabled, computer will sleep for 1 second on given placements
  - 2 seconds for random placements
=end

require 'yaml'
MESSAGES = YAML.load_file('ttt_messages.yml')

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

WIN_COUNT = { 'Player' => 0, 'Computer' => 0 }

INITIAL_MARKER = ' '

def prompt(msg)
  puts ">> #{msg}"
end

def clear_screen
  ((system "cls") | (system "clear")) # multiple OS support
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts "You're a #{brd[1]}. Computer is #{brd[2]}."
  puts ""
  puts(MESSAGES['lines'])
  puts "  #{brd[0][1]}  |  #{brd[0][2]}  |  #{brd[0][3]}  "
  puts(MESSAGES['lines'])
  puts(MESSAGES['dividers'])
  puts(MESSAGES['lines'])
  puts "  #{brd[0][4]}  |  #{brd[0][5]}  |  #{brd[0][6]}  "
  puts(MESSAGES['lines'])
  puts(MESSAGES['dividers'])
  puts(MESSAGES['lines'])
  puts "  #{brd[0][7]}  |  #{brd[0][8]}  |  #{brd[0][9]}  "
  puts(MESSAGES['lines'])
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  (1..9).each_with_object({}) do |num, new_board|
    new_board[num] = INITIAL_MARKER
  end
end

def order_picker(input)
  input.downcase.start_with?('o') ? decide_order : %w(c p).sample
end

def decide_order
  loop do
    prompt(MESSAGES['first'])
    ans = gets.chomp.downcase
    if ans.start_with?('c', 'p')
      return ans.chr
    else
      prompt(MESSAGES['valid'])
    end
  end
end

def board_and_markers(brd, player_char, computer_char)
  [brd, player_char, computer_char]
end

def alternate_player(current_player)
  current_player == 'c' ? 'p' : 'c'
end

def joinor(empty_squares, delim = ', ', last = 'or')
  return empty_squares.first.to_s if empty_squares.size == 1
  return empty_squares.join(" #{last} ") if empty_squares.size == 2
  empty_squares.join(delim).insert(-2, "#{last} ")
end

def empty_squares(hsh)
  hsh.keys.select { |num| hsh[num] == INITIAL_MARKER }
end

def place_piece!(brd, current_player, timed)
  computer_places_piece!(brd, timed) if current_player == 'c'
  player_places_piece!(brd) if current_player == 'p'
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose from squares: #{joinor(empty_squares(brd[0]))}"
    square = gets.chomp.to_i
    break if empty_squares(brd[0]).include?(square)
    prompt(MESSAGES['valid'])
  end

  brd[0][square] = brd[1]
end

def computer_places_piece!(brd, timed)
  if brd[0][5] == ' '
    set_5!(brd, timed)
  elsif find_risk(brd).nil?
    set_random!(brd, timed)
  else
    set_fixed!(brd, timed)
  end
end

def find_at_risk_square(brd, idx)
  WINNING_LINES.each do |line|
    sub_brd = brd[0].select { |key, _| line.include?(key) }
    if (brd[0].values_at(*line).count(brd[idx]) == 2) &&
       (sub_brd.values.any?(INITIAL_MARKER))
      return sub_brd.key(INITIAL_MARKER)
    end
  end
end

def find_risk(brd)
  idx = 2
  2.times do
    val = find_at_risk_square(brd, idx)
    return val if val != WINNING_LINES
    idx = 1
  end
  nil
end

def set_5!(brd, timed)
  sleep 1 if timed
  brd[0][5] = brd[2]
end

def set_random!(brd, timed)
  sleep 2 if timed
  square = empty_squares(brd[0]).sample
  brd[0][square] = brd[2]
end

def set_fixed!(brd, timed)
  sleep 1 if timed
  val = find_risk(brd)
  brd[0][val] = brd[2]
end

def board_full?(board)
  !!empty_squares(board).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[0].values_at(*line).count(brd[1]) == 3
      return 'Player'
    elsif brd[0].values_at(*line).count(brd[2]) == 3
      return 'Computer'
    end
  end
  nil
end

def update_win_totals!(brd)
  case detect_winner(brd)
  when 'Player' then WIN_COUNT['Player'] += 1
  when 'Computer' then WIN_COUNT['Computer'] += 1
  end
end

def five_wins?
  !!WIN_COUNT.values.any?(5)
end

# main program
player_char = 'X'
computer_char = 'O'
timed = false
board_info = nil

loop do
  input = ''

  loop do
    prompt(MESSAGES['welcome'])
    input = gets.chomp.downcase
    clear_screen
    case input.chr
    when 'r' then prompt(MESSAGES['rules'] + "\n")
    when '1' then player_char, computer_char = computer_char, player_char
    when '2' then timed = true
    else break input
    end
  end

  first = order_picker(input)

  loop do
    board = initialize_board
    current_player = first

    loop do
      board_info = board_and_markers(board, player_char, computer_char)
      display_board(board_info)
      place_piece!(board_info, current_player, timed)
      current_player = alternate_player(current_player)
      break if someone_won?(board_info) || board_full?(board)
      clear_screen
    end

    display_board(board_info)

    if someone_won?(board_info)
      update_win_totals!(board_info)
      prompt "#{detect_winner(board_info)} won!"
    else
      prompt(MESSAGES['tie'])
    end

    prompt("Player has #{WIN_COUNT['Player']} wins!")
    prompt("Computer has #{WIN_COUNT['Computer']} wins!")
    break prompt "#{WIN_COUNT.key(5)} is the winner!" if five_wins?
  end

  prompt(MESSAGES['again'])
  answer = gets.chomp
  clear_screen
  break unless answer.downcase.start_with?('y')
  WIN_COUNT.each_key { |key| WIN_COUNT[key] = 0 }
end

prompt(MESSAGES['bye'])