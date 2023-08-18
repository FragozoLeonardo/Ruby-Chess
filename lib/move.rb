# frozen_string_literal: true

class Move
  attr_reader :piece, :validator

  def initialize(piece, validator)
    @piece = piece
    @validator = validator
  end

  def valid_move?(start, destination, capture = false)
    if capture
      validator.valid_capture?(piece.color, start, destination)
    else
      validator.valid_advance?(piece.color, start, destination, piece.first_move)
    end
  end

  def execute_move(start, destination, capture = false)
    raise 'Invalid move' unless valid_move?(start, destination, capture)

    piece.position = destination
    piece.first_move = false
  end
end
