# frozen_string_literal: true

class Player
  attr_reader :name, :color
  attr_accessor :moves

  def initialize(name, color)
    @name = name
    @color = color.to_s
    @moves = []
  end

  def add_move(move)
    @moves << move
  end

  def clear_moves
    @moves = []
  end

  def has_moves?
    !@moves.empty?
  end

  def next_move
    @moves.shift
  end
end
