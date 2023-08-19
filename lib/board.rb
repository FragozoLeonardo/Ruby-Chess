# frozen_string_literal: true

require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    setup_initial_pieces
  end

  def place_piece(piece, position)
    @grid[position[0]][position[1]] = piece
  end

  def get_piece(position)
    @grid[position[0]][position[1]]
  end

  def move_piece(start, destination)
    piece = get_piece(start)
    return false unless piece

    if piece.valid_move?(start, destination)
      place_piece(piece, destination)
      place_piece(nil, start)
      piece.position = destination
      true
    else
      false
    end
  end

  def display
    puts '   a b c d e f g h'
    puts '  -----------------'
    @grid.each_with_index do |row, i|
      print "#{8 - i} |"
      row.each do |piece|
        symbol = piece ? piece.symbol : ' '
        print " #{symbol}"
      end
      puts ' |'
    end
    puts '  -----------------'
  end

  def setup_initial_pieces
    validator = Validator.new

    @grid[0][0] = Rook.new('white', validator)
    @grid[0][1] = Knight.new('white', validator)
    @grid[0][2] = Bishop.new('white', validator)
    @grid[0][3] = Queen.new('white', validator)
    @grid[0][4] = King.new('white', validator)
    @grid[0][5] = Bishop.new('white', validator)
    @grid[0][6] = Knight.new('white', validator)
    @grid[0][7] = Rook.new('white', validator)

    @grid[7][0] = Rook.new('black', validator)
    @grid[7][1] = Knight.new('black', validator)
    @grid[7][2] = Bishop.new('black', validator)
    @grid[7][3] = Queen.new('black', validator)
    @grid[7][4] = King.new('black', validator)
    @grid[7][5] = Bishop.new('black', validator)
    @grid[7][6] = Knight.new('black', validator)
    @grid[7][7] = Rook.new('black', validator)

    @grid[1][0] = Pawn.new('white', validator)
    @grid[1][1] = Pawn.new('white', validator)
    @grid[1][2] = Pawn.new('white', validator)
    @grid[1][3] = Pawn.new('white', validator)
    @grid[1][4] = Pawn.new('white', validator)
    @grid[1][5] = Pawn.new('white', validator)
    @grid[1][6] = Pawn.new('white', validator)
    @grid[1][7] = Pawn.new('white', validator)

    @grid[6][0] = Pawn.new('black', validator)
    @grid[6][1] = Pawn.new('black', validator)
    @grid[6][2] = Pawn.new('black', validator)
    @grid[6][3] = Pawn.new('black', validator)
    @grid[6][4] = Pawn.new('black', validator)
    @grid[6][5] = Pawn.new('black', validator)
    @grid[6][6] = Pawn.new('black', validator)
    @grid[6][7] = Pawn.new('black', validator)
  end

  def update_board(start_position, destination_position)
    piece = @grid[start_position[0]][start_position[1]]
    @grid[start_position[0]][start_position[1]] = nil
    @grid[destination_position[0]][destination_position[1]] = piece
  end
end
