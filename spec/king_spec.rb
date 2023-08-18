# frozen_string_literal: true

# king_spec.rb
require './lib/king'
require './lib/validator'

RSpec.describe King do
  let(:validator) { instance_double(Validator) }
  let(:white_king) { King.new('white', validator) }
  let(:black_king) { King.new('black', validator) }

  describe '#valid_move?' do
    context 'when moving within one square' do
      it 'returns true for a valid move' do
        start = [1, 1]
        destination = [2, 2]

        expect(validator).to receive(:valid_king_move?).with(start, destination).and_return(true)
        expect(white_king.valid_move?(start, destination)).to be true
      end
    end

    context 'when moving beyond one square' do
      it 'returns false for a move of two squares' do
        start = [1, 1]
        destination = [3, 1]

        expect(validator).to receive(:valid_king_move?).with(start, destination).and_return(false)
        expect(white_king.valid_move?(start, destination)).to be false
      end

      it 'returns false for a move of three squares' do
        start = [1, 1]
        destination = [4, 1]

        expect(validator).to receive(:valid_king_move?).with(start, destination).and_return(false)
        expect(white_king.valid_move?(start, destination)).to be false
      end
    end
  end
end
