# frozen_string_literal: true

# piece_spec.rb
require 'piece'

RSpec.describe Piece do
  let(:white_piece) { Piece.new('white', "\u2654") }
  let(:black_piece) { Piece.new('black', "\u265A") }

  describe '#initialize' do
    it 'initializes with the correct color' do
      expect(white_piece.color).to eq('white')
      expect(black_piece.color).to eq('black')
    end
  end
end
