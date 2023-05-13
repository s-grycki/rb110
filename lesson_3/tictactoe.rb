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
Feature 5: Number of rounds
  - Allows player to select number of rounds needed to win
=end

require 'yaml'
MESSAGES = YAML.load_file('ttt_messages.yml')

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '

def prompt(msg)
  puts ">> #{msg}"
end

def clear_screen
  ((system "cls") | (system "clear")) # multiple OS support
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  puts "You're a #{board[1]}. Computer is #{board[2]}."
  puts ""
  puts(MESSAGES['lines'])
  puts "  #{board[0][1]}  |  #{board[0][2]}  |  #{board[0][3]}  "
  puts(MESSAGES['lines'])
  puts(MESSAGES['dividers'])
  puts(MESSAGES['lines'])
  puts "  #{board[0][4]}  |  #{board[0][5]}  |  #{board[0][6]}  "
  puts(MESSAGES['lines'])
  puts(MESSAGES['dividers'])
  puts(MESSAGES['lines'])
  puts "  #{board[0][7]}  |  #{board[0][8]}  |  #{board[0][9]}  "
  puts(MESSAGES['lines'])
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  (1..9).each_with_object({}) do |num, new_board|
    new_board[num] = INITIAL_MARKER
  end
end

def alternate_player(current_player)
  current_player == 'Computer' ? 'Player' : 'Computer'
end

def joinor(empty_squares, delim = ', ', last = 'or')
  return empty_squares.first.to_s if empty_squares.size == 1
  return empty_squares.join(" #{last} ") if empty_squares.size == 2
  empty_squares.join(delim).insert(-2, "#{last} ")
end

def empty_squares(hsh)
  hsh.keys.select { |num| hsh[num] == INITIAL_MARKER }
end

def place_piece!(board, current_player, timed)
  computer_places_piece!(board, timed) if current_player == 'Computer'
  player_places_piece!(board) if current_player == 'Player'
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose from squares: #{joinor(empty_squares(board[0]))}"
    square = gets.chomp.to_i
    break if empty_squares(board[0]).include?(square)
    prompt(MESSAGES['valid'])
  end

  board[0][square] = board[1]
end

def computer_places_piece!(board, timed)
  if board[0][5] == ' '
    set_5!(board, timed)
  elsif find_risk(board).nil?
    set_random!(board, timed)
  else
    set_fixed!(board, timed)
  end
end

def find_at_risk_square(board, idx)
  WINNING_LINES.each do |line|
    sub_board = board[0].select { |key, _| line.include?(key) }
    if (board[0].values_at(*line).count(board[idx]) == 2) &&
       (sub_board.values.any?(INITIAL_MARKER))
      return sub_board.key(INITIAL_MARKER)
    end
  end
end

def find_risk(board)
  idx = 2
  2.times do
    val = find_at_risk_square(board, idx)
    return val if val != WINNING_LINES
    idx = 1
  end
  nil
end

def set_5!(board, timed)
  sleep 1 if timed[0] == 'on'
  board[0][5] = board[2]
end

def set_random!(board, timed)
  sleep 2 if timed[0] == 'on'
  square = empty_squares(board[0]).sample
  board[0][square] = board[2]
end

def set_fixed!(board, timed)
  sleep 1 if timed[0] == 'on'
  val = find_risk(board)
  board[0][val] = board[2]
end

def board_full?(board)
  !!empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board[0].values_at(*line).count(board[1]) == 3
      return 'Player'
    elsif board[0].values_at(*line).count(board[2]) == 3
      return 'Computer'
    end
  end
  nil
end

def update_win_totals!(board, win_count)
  case detect_winner(board)
  when 'Player' then win_count['Player'] += 1
  when 'Computer' then win_count['Computer'] += 1
  end
end

def display_wins(win_count)
  win_count.each { |key, val| prompt("#{key} has #{val} wins!") }
end

def full_wins?(win_count, rounds)
  !!win_count.values.any?(rounds)
end

def play_again?(answer)
  !!answer.downcase.start_with?('y')
end

# main program
player_char = 'X'
computer_char = 'O'
timed = %w(off on)
board_info = nil
first = %w(Random Player Computer)
rounds = 5

loop do
  input = ''
  win_count = { 'Player' => 0, 'Computer' => 0 }

  loop do
    prompt(MESSAGES['welcome'])
    # rubocop:disable Layout/LineLength
    prompt("Player: #{player_char}, Computer: #{computer_char}. Enter 'P' to switch")
    # rubocop:enable Layout/LineLength
    prompt("Starting Player: #{first[0]}. Enter 'O' to swtich")
    prompt("Fast Mode: #{timed[0]}. Enter 'T' to toggle")
    prompt("Number of winning rounds #{rounds}. Enter a number (1-9) to change")
    prompt(MESSAGES['begin'])
    input = gets.chomp.upcase
    clear_screen
    case input.chr
    when 'R' then prompt(MESSAGES['rules'] + "\n")
    when 'P' then player_char, computer_char = computer_char, player_char
    when 'T' then timed = timed.rotate
    when 'O' then first = first.rotate
    when ('1'..'9') then rounds = input.to_i
    else break input
    end
  end

  first = if first[0] == 'Random'
            %w(Player Computer).sample
          else
            first[0]
          end

  loop do
    board = initialize_board
    current_player = first

    loop do
      board_info = [board, player_char, computer_char]
      display_board(board_info)
      place_piece!(board_info, current_player, timed)
      current_player = alternate_player(current_player)
      break if someone_won?(board_info) || board_full?(board)
      clear_screen
    end

    display_board(board_info)

    if someone_won?(board_info)
      update_win_totals!(board_info, win_count)
      prompt "#{detect_winner(board_info)} won!"
    else
      prompt(MESSAGES['tie'])
    end
    display_wins(win_count)
    # rubocop:disable Layout/LineLength
    break prompt "#{win_count.key(rounds)} is the winner!" if full_wins?(win_count, rounds)
    # rubocop:enable Layout/LineLength
  end

  prompt(MESSAGES['again'])
  answer = gets.chomp
  clear_screen
  break unless play_again?(answer)
end

prompt(MESSAGES['bye'])