# frozen_string_literal: true

class Piece
  attr_reader :color, :symbol

  def initialize(color, symbol)
    @color = color
    @symbol = symbol
  end
end
