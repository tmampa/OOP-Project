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

class Players
end

class Board
end
