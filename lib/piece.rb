# frozen_string_literal: true

class Piece
  attr_accessor :position, :first_move
  attr_reader :color, :symbol

  def initialize(color, symbol)
    @color = color
    @symbol = symbol
    @first_move = true
  end
end
