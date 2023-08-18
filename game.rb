# frozen_string_literal: true

require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/validator'



# game.rb
class Game
  def initialize(player1, player2)
    @board = Board.new
    @validator = Validator.new
    @players = [player1, player2]
    @current_player = @players.first
  end

  def start
    puts 'Welcome to Chess!'
    @board.setup_initial_pieces

    loop do
      print_board
      move = get_player_move

      break if move.nil?

      if valid_move?(move)
        execute_move(move)
        switch_players
      else
        puts 'Invalid move. Try again.'
      end
    end

    puts 'Game over.'
  end

  private

  def print_board
    @board.display
  end

  def get_player_move
    puts "#{current_player.name}, enter your move (e.g., 'a2 to a4') or 'quit' to exit:"
    input = gets.chomp.downcase

    return nil if input == 'quit'

    parse_move(input)
  end

  def parse_move(input)
    move_parts = input.split(' to ')
    return nil unless move_parts.size == 2

    start_position = parse_position(move_parts.first)
    destination_position = parse_position(move_parts.last)

    return nil unless start_position && destination_position

    piece = @board.get_piece(start_position)

    puts "Piece at start position: #{piece}"
    $stdout.flush
    puts "Current player: #{@current_player}"
    $stdout.flush

    return nil unless piece && piece.color == @current_player.color

    Move.new(piece, start_position, destination_position)
  end

  def parse_position(input)
    return nil unless input.match?(/^[a-h][1-8]$/)

    [input[1].to_i - 1, input[0].ord - 'a'.ord]
  end

  def valid_move?(move)
    move.valid?
  end

  def execute_move(move)
    move.execute
  end

  def switch_players
    @current_player = @players.find { |player| player != @current_player }
  end

  attr_reader :current_player
end

# Instantiate Player objects
player1 = Player.new("Player 1", :white)
player2 = Player.new("Player 2", :black)

# Instantiate the Game class with the player objects
game = Game.new(player1, player2)

# Start the game loop
game.start
