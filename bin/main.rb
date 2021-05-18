#!/usr/bin/env ruby

class Players
  attr_reader :players_set, :players, :plays

  def initialize
    @players = []
    @players_set = false
    @plays = 0
    @board = [' 1', ' 2', ' 3', ' 4', ' 5', ' 6', ' 7', ' 8', ' 9']
  end

  def set_player(name, weapon)
    if @players.length == 2
      @players_set = true
    else
      @players = { 'name' => name, 'weapon' => weapon }
    end
  end

  def display_board(board)
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts '---------'
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts '---------'
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end

  def move
    @plays += 1
    display_board(@board)

    if @plays.odd?
      puts 'Player 1 please choose a position'
      response = gets.chomp
    else
      puts 'Player 2 please choose a position'
      response = gets.chomp
    end
  end
end

class Game
  attr_reader :on

  def initialize
    puts '@3'
    @on = false
    @players = Players.new
  end

  def play
    if @players.players_set
      puts "@1 #{@players.players.length}"
      @players.move
    elsif @players.players.length.zero?
      puts 'Player 1, please enter your name'
      name = gets.chomp
      weapon = gets.chomp
      @players.set_player(name, weapon)
    else
      puts 'Player 2, please enter your name'
      name = gets.chomp
      weapon = gets.chomp
      @players.set_player(name, weapon)
    end
  end
end

game = Game.new

game.play until game.on
