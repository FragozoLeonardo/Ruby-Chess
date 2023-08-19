# frozen_string_literal: true

class Move
  attr_reader :piece, :validator, :start, :destination

  def initialize(piece, validator, start, destination)
    @piece = piece
    @validator = validator
    @start = start
    @destination = destination
  end

  def valid_move?(capture = false)
    if capture
      validator.valid_capture?(piece.color, start, destination)
    else
      validator.valid_advance?(piece.color, start, destination, piece.first_move)
    end
  end

  def execute_move(capture = false)
    raise 'Invalid move' unless valid_move?(capture)

    piece.position = destination
    piece.first_move = false
  end

  def start_position
    start
  end

  def destination_position
    destination
  end
end
