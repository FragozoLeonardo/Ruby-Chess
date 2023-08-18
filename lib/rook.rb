# frozen_string_literal: true

require_relative 'piece'

class Rook < Piece
  def initialize(color, validator)
    super(color, color == 'white' ? "\u2656" : "\u265C")
    @validator = validator
  end

  def valid_move?(start, destination)
    @validator.valid_rook_move?(start, destination)
  end
end
