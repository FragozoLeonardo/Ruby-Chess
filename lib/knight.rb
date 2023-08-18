# frozen_string_literal: true

require_relative 'piece'

class Knight < Piece
  def initialize(color, validator)
    super(color, color == 'white' ? "\u2658" : "\u265E")
    @validator = validator
  end

  def valid_move?(start, destination)
    @validator.valid_knight_move?(start, destination)
  end
end
