# frozen_string_literal: true

require_relative 'piece'

class Bishop < Piece
  def initialize(color, validator)
    super(color)
    @validator = validator
  end

  def valid_move?(start, destination)
    @validator.valid_bishop_move?(start, destination)
  end
end
