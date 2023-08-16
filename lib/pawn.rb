# frozen_string_literal: true

require_relative 'piece'
class Pawn < Piece
  def initialize(color, validator)
    super(color)
    @validator = validator
    @first_move = true
  end

  def valid_move?(start, destination, capture = false)
    if capture
      @validator.valid_capture?(color, start, destination)
    else
      @validator.valid_advance?(color, start, destination, @first_move)
    end
  end

  def move
    @first_move = false
  end
end
