# frozen_string_literal: true

# knight_spec.rb
require 'knight'
require 'validator'

RSpec.describe Knight do
  let(:validator) { instance_double(Validator) }
  let(:white_knight) { Knight.new('white', validator) }
  let(:black_knight) { Knight.new('black', validator) }

  describe '#valid_move?' do
    context 'when moving in an L-shape' do
      it 'returns true for a valid L-shape move' do
        start = [1, 1]
        destination = [3, 2]

        expect(validator).to receive(:valid_knight_move?).with(start, destination).and_return(true)
        expect(white_knight.valid_move?(start, destination)).to be true
      end

      it 'returns false for a non-L-shape move' do
        start = [1, 1]
        destination = [2, 2]

        expect(validator).to receive(:valid_knight_move?).with(start, destination).and_return(false)
        expect(white_knight.valid_move?(start, destination)).to be false
      end
    end

    context 'when not moving in an L-shape' do
      it 'returns false for a vertical move' do
        start = [1, 1]
        destination = [5, 1]

        expect(validator).to receive(:valid_knight_move?).with(start, destination).and_return(false)
        expect(white_knight.valid_move?(start, destination)).to be false
      end

      it 'returns false for a horizontal move' do
        start = [1, 1]
        destination = [1, 5]

        expect(validator).to receive(:valid_knight_move?).with(start, destination).and_return(false)
        expect(white_knight.valid_move?(start, destination)).to be false
      end
    end
  end
end
