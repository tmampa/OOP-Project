#!/usr/bin/env ruby
class Game
  def initialize
    @players = Players.new
  end

  def move
    @end = false
    @gameboard = Board.new
    @turn = 1
    while @turn < 10
      if @turn.odd?
        turn_sequence(@players.player1,)
      elsif @turn.even?
        turn_sequence(@players.player2,)
      end
    end
  end
end

def turn_sequence(player)
  puts "#{player} please choose a position"
  @player_move = gets.chomp.to_i
  if (1..9).include?(@player_move) && @gameboard.board[@player_move] == ' ' && @end == false
    @turn += 1
    @gameboard.board_update
  else
    puts "Please enter a number between 1 to 9 in an emmpty location\n"
  end
end

class Players
  attr_reader :player1, :player2

  def initialize
    puts 'Player 1, please enter your name'
    @player1 = gets.chomp
    puts "#{@player1} is X"
    puts 'Player 2, please enter your name'
    @player2 = gets.chomp
    puts "#{@player2} is O"
  end
end

class Board
  attr_reader :board

  def initialize
    puts 'On your turn enter one of the following numbers to place your piece in the corresponding location:'
    # puts '0 | 1 | 2'
    # puts '---------'
    # puts '3 | 4 | 5'
    # puts '---------'
    # puts '6 | 7 | 8'
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    board_update
  end

  def board_update
    # @board[position] = symbol
    game_board_display(@board)
  end

  def game_board_display(board)
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts '---------'
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts '---------'
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end
end

game = Game.new
game.move
