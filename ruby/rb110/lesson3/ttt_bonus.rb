#!/usr/bin/env ruby

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, score)
  system 'clear'
  prompt "Current score is Player #{score[:player]} Computer #{score[:computer]}"
  prompt "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initalize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def place_piece!(board, current)
  if current == :player
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def computer_places_piece!(brd)
  empty = empty_squares(brd)
  square = beat_player_square(brd)  ||
           block_player_square(brd) ||
           (5 if empty.include?(5)) ||
           empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def block_player_square(brd)
  winning_square(brd, PLAYER_MARKER)
end

def beat_player_square(brd)
  winning_square(brd, COMPUTER_MARKER)
end

def winning_square(brd, mark)
  WINNING_LINES.each do |line|
    markers = brd.values_at(*line)
    if markers.count(mark) == 2 &&
       markers.count(INITIAL_MARKER) == 1
      squares = brd.select { |k, v| line.include?(k) }
      return squares.key(INITIAL_MARKER)
    end
  end
  nil
end

def round_over?(board, current)
  marker = (current == :player) ? PLAYER_MARKER : COMPUTER_MARKER
  winner?(board, marker) || board_full?(board)
end

def winner?(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 3
      return true
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def alternate_player(current)
  [:player, :computer].select { |elem| elem != current }.first
end

loop do     # A match
  games_won = {:player => 0, :computer => 0}

  prompt "Do you want to play first? (y or n)?"
  first_player = :player if gets.chomp.downcase.start_with?('y')
  unless first_player
    prompt "Computer will decide who plays first"
    first_player = [:player, :computer].sample
    prompt "Press any key to continue"
    gets.chomp
  end

  loop do   # Five rounds
    board = initalize_board
    current_player = first_player

    loop do # A single round
      display_board(board, games_won)
      place_piece!(board, current_player)
      break if round_over?(board, current_player)
      current_player = alternate_player(current_player)
    end

    display_board(board, games_won)

    if winner?(board, PLAYER_MARKER)
      games_won[:player] += 1
      prompt "Player won this round!"
    elsif winner?(board, COMPUTER_MARKER)
      prompt "Computer won this round!"
      games_won[:computer] += 1
    else
      prompt "It's a tie!"
    end

    champion = games_won.key(5)
    unless champion
      prompt "The first player to win five rounds wins the match"
      prompt "Press any key to start another round"
      gets.chomp # Block execution until user input
      next
    end
    prompt "#{champion.capitalize} has won the match!"
    break
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end
