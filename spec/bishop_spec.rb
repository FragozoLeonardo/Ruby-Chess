# frozen_string_literal: true

# bishop_spec.rb
require 'bishop'
require 'validator'

RSpec.describe Bishop do
  let(:validator) { instance_double(Validator) }
  let(:white_bishop) { Bishop.new('white', validator) }
  let(:black_bishop) { Bishop.new('black', validator) }

  describe '#valid_move?' do
    context 'when moving diagonally' do
      it 'returns true for a valid diagonal move' do
        start = [1, 1]
        destination = [4, 4]

        expect(validator).to receive(:valid_bishop_move?).with(start, destination).and_return(true)
        expect(white_bishop.valid_move?(start, destination)).to be true
      end

      it 'returns false for a non-diagonal move' do
        start = [1, 1]
        destination = [5, 2]

        expect(validator).to receive(:valid_bishop_move?).with(start, destination).and_return(false)
        expect(white_bishop.valid_move?(start, destination)).to be false
      end
    end

    context 'when not moving diagonally' do
      it 'returns false for a vertical move' do
        start = [1, 1]
        destination = [5, 1]

        expect(validator).to receive(:valid_bishop_move?).with(start, destination).and_return(false)
        expect(white_bishop.valid_move?(start, destination)).to be false
      end

      it 'returns false for a horizontal move' do
        start = [1, 1]
        destination = [1, 5]

        expect(validator).to receive(:valid_bishop_move?).with(start, destination).and_return(false)
        expect(white_bishop.valid_move?(start, destination)).to be false
      end
    end
  end
end
