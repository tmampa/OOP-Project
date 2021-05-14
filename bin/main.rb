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
        turn_sequence(@players.player1, 'X')
      elsif @turn.even?
        turn_sequence(@players.player2, 'O')
      end
    end
  end
end

def turn_sequence(player, symbol)
  puts "#{player}(#{symbol}) please choose a position"
  @player_move = gets.chomp.to_i
  if (1..9).include?(@player_move) && @gameboard.board[@player_move] == ' ' && @end == false
    @turn += 1
    @gameboard.board_update(@player_move, symbol)
    win_check
    draw_check
  else
    puts "Please enter a number between 1 to 9 in an emmpty location\n"
  end
end

class Players
end

class Board
end
