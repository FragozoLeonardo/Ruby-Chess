# frozen_string_literal: true

class Move
  attr_reader :pawn, :validator

  def initialize(pawn, validator)
    @pawn = pawn
    @validator = validator
  end

  def valid_move?(start, destination, capture = false)
    if capture
      validator.valid_capture?(pawn.color, start, destination)
    else
      validator.valid_advance?(pawn.color, start, destination, pawn.first_move)
    end
  end

  def execute_move(start, destination, capture = false)
    raise 'Invalid move' unless valid_move?(start, destination, capture)

    pawn.position = destination
    pawn.first_move = false
  end
end
