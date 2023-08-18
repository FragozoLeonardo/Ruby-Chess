# frozen_string_literal: true

require_relative 'piece'

class Queen < Piece
  def initialize(color, validator)
    super(color, color == 'white' ? "\u2655" : "\u265B")
    @validator = validator
  end

  def valid_move?(start, destination)
    @validator.valid_queen_move?(start, destination)
  end
end
