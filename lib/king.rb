# frozen_string_literal: true

require_relative 'piece'

class King < Piece
  def initialize(color, validator)
    super(color, color == 'white' ? "\u2654" : "\u265A")
    @validator = validator
  end

  def valid_move?(start, destination)
    @validator.valid_king_move?(start, destination)
  end
end
