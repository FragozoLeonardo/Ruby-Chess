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
  end

  def place_piece(piece, position)
    @grid[position[0]][position[1]] = piece
  end

  def get_piece(position)
    @grid[position[0]][position[1]]
  end

  def display
    @grid.each do |row|
      row.each do |piece|
        symbol = piece ? piece.symbol : ' '
        print "#{symbol} "
      end
      puts
    end
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

    8.times do |col|
      @grid[1][col] = Pawn.new('white', validator)
      @grid[6][col] = Pawn.new('black', validator)
    end
  end
end
