#!/usr/bin/env ruby

class Player
  attr_reader :name, :letter, :position

  # rubocop:disable Style/ClassVars
  @@player_letters = []
  def initialize(name, letter)
    @name = name
    until letter[0] != '.' && !@@player_letters.include?(letter[0])
      puts "Please select a different weapon besides \"#{letter[0]}\""
      letter = gets.chomp
      @letter = letter
    end
    @letter = letter[0]
    @@player_letters << @letter
  end
end
# rubocop:enable Style/ClassVars

class Board
  attr_reader :board

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
# rubocop:disable Lint/UselessAssignment

puts 'Player 1: Enter your name'
name = gets.chomp
puts "Choose your weapon #{name}?"
letter = gets.chomp
player1 = Player.new(name, letter)

puts 'Player 2: Enter your name.'
name = gets.chomp
puts "Choose your weapon #{name}?"
letter = gets.chomp
player2 = Player.new(name, letter)

# rubocop:enable Lint/UselessAssignment

puts "\n---------Match started--------\n"

game_board = Board.new
game_board.display_board
print "\n"
