# frozen_string_literal: true

# rook_spec.rb
require 'rook'
require 'validator'

RSpec.describe Rook do
  let(:validator) { instance_double(Validator) }
  let(:white_rook) { Rook.new('white', validator) }
  let(:black_rook) { Rook.new('black', validator) }

  describe '#valid_move?' do
    context 'when moving vertically' do
      it 'returns true for a valid vertical move' do
        start = [1, 1]
        destination = [5, 1]

        expect(validator).to receive(:valid_rook_move?).with(start, destination).and_return(true)
        expect(white_rook.valid_move?(start, destination)).to be true
      end

      it 'returns false for an invalid vertical move' do
        start = [1, 1]
        destination = [5, 2]

        expect(validator).to receive(:valid_rook_move?).with(start, destination).and_return(false)
        expect(white_rook.valid_move?(start, destination)).to be false
      end
    end

    context 'when moving horizontally' do
      it 'returns true for a valid horizontal move' do
        start = [1, 1]
        destination = [1, 5]

        expect(validator).to receive(:valid_rook_move?).with(start, destination).and_return(true)
        expect(white_rook.valid_move?(start, destination)).to be true
      end

      it 'returns false for an invalid horizontal move' do
        start = [1, 1]
        destination = [2, 5]

        expect(validator).to receive(:valid_rook_move?).with(start, destination).and_return(false)
        expect(white_rook.valid_move?(start, destination)).to be false
      end
    end

    context 'when moving diagonally' do
      it 'returns false for a diagonal move' do
        start = [1, 1]
        destination = [5, 5]

        expect(validator).to receive(:valid_rook_move?).with(start, destination).and_return(false)
        expect(white_rook.valid_move?(start, destination)).to be false
      end
    end
  end
end
