# frozen_string_literal: true

class Move
  attr_reader :piece, :validator, :start, :destination

  def initialize(piece, validator, start, destination)
    @piece = piece
    @validator = validator
    @start = start
    @destination = destination
  end

  def valid_move?(_capture = false)
    case piece
    when Pawn
      validator.valid_pawn_move?(start, destination)
    when Rook
      validator.valid_rook_move?(start, destination)
    when Bishop
      validator.valid_bishop_move?(start, destination)
    when Knight
      validator.valid_knight_move?(start, destination)
    when King
      validator.valid_king_move?(start, destination)
    when Queen
      validator.valid_queen_move?(start, destination)
    else
      raise 'Invalid piece type'
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
