#!/usr/bin/env ruby
$plays = 0

class Game
  attr_reader :game_on, :plays

  def initialize
    @game_on = true
    @players = Players.new
  end

  def move
    @end = false
    @gameboard = Board.new
    @turn = 1

    while @turn < 3
      if @turn.odd?
        turn_sequence(@players.player1)
      elsif @turn.even?
        turn_sequence(@players.player2)
        $plays += 1
      end
    end
  end
end

def turn_sequence(player)
  puts "#{player} please choose a position"
  @player_move = gets.chomp.to_i
  if (1..9).include?(@player_move) && @end == false
    @turn += 1
    @gameboard.board_update
  else
    puts "Please enter a number between 1 to 9 in an empty location\n"
  end
end

def valid_name(name)
  name == ''
end

class Players
  attr_reader :player1, :player2

  def initialize
    puts 'Player 1, please enter your name'

    @player1 = gets.chomp

    while valid_name(@player1)
      puts 'Player 1, please enter a valid name'
      @player1 = gets.chomp
    end

    puts "#{@player1} is X"

    puts 'Player 2, please enter your name'
    @player2 = gets.chomp

    while valid_name(@player2)
      puts 'Player 2, please enter a valid name'
      @player2 = gets.chomp
    end

    puts "#{@player2} is O"
  end
end

class Board
  attr_reader :board

  def initialize
    puts 'On your turn enter one of the following numbers to place your piece in the corresponding location:'
    @board = [' 0', ' 1', ' 2', ' 3', ' 4', ' 5', ' 6', ' 7', ' 8']
    board_update
  end

  def board_update
    display_board(@board)
  end

  def display_board(board)
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts '---------'
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts '---------'
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end
end

game = Game.new

while game.game_on
  if $plays == 0
    game.move
  elsif $plays == 1
    puts 'Wins!'
    puts 'Please '
    response = gets.chomp

    if response == 'Y'
      $plays += 1
    else break
    end
  else
    puts 'draw!'
    break
  end
end
