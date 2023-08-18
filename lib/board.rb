# frozen_string_literal: true

# board.rb
class Board
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
    @grid.each_with_index do |row, _row_index|
      row.each_with_index do |piece, _col_index|
        symbol = piece ? piece.symbol : ' '
        print "#{symbol} "
      end
      puts
    end
  end
end
