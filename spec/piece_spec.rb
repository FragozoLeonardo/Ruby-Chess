# frozen_string_literal: true

require 'piece'

RSpec.describe Piece do
  let(:white_piece) { Piece.new('white') }
  let(:black_piece) { Piece.new('black') }

  describe '#initialize' do
    it 'initializes with the correct color' do
      expect(white_piece.color).to eq('white')
      expect(black_piece.color).to eq('black')
    end
  end
end
