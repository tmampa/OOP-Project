#!/usr/bin/env ruby
class Player
  @@player_weapons = []

  def initialize(name, weapon)
    @name = name

    until weapon[0] != '.' && !@@player_weapons.include?(weapon[0])
      puts "Please select a different weapon besides \"#{weapon[0]}\""
      weapon = gets.chomp
      @weapon = weapon
    end

    @weapon = weapon[0]
    @@player_weapons << @weapon
  end

  attr_reader :name, :weapon
end

class Board
  def initialize
    @board = [*'1'..'9']
  end

  def initialize_copy(original)
    @board = original.board.dup
  end

  def display_board
    puts ''
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '---+---+---'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '---+---+---'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts ''
  end
end

puts 'Player 1: Enter your name'
name = gets.chomp

puts "Choose your weapon #{name}?"
weapon = gets.chomp

player1 = Player.new(name, weapon)

puts 'Player 2: Enter your name.'
name = gets.chomp

puts "Choose your weapon #{name}?"
weapon = gets.chomp

player2 = Player.new(name, weapon)

puts "\n--------Match started-------\n"

game_board = Board.new
game_board.display_board

puts "It's #{player1.name}'s turn!"
puts 'Please select an available cell form the board (1-9)'

avail_cell = gets.chomp

until game_board.board.include?(avail_cell)
  puts 'That an invalid move'
  avail_cell = gets.chomp
end
