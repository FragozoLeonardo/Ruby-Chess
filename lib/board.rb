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
end
