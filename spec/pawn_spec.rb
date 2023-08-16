# frozen_string_literal: true

require 'pawn'
require 'validator'

RSpec.describe Pawn do
  let(:validator) { Validator.new }
  let(:move) { Move.new(white_pawn) }
  let(:white_pawn) { Pawn.new('white', validator) }
  let(:black_pawn) { Pawn.new('black', validator) }

  describe '#valid_move?' do
    context 'when not capturing' do
      it 'returns true for a valid advance move' do
        start = [1, 1]
        destination = [2, 1]
        capture = false

        expect(validator).to receive(:valid_advance?).with('white', start, destination, true).and_return(true)
        expect(white_pawn.valid_move?(start, destination, capture)).to be true
      end

      it 'returns false for an invalid advance move' do
        start = [1, 1]
        destination = [3, 1]
        capture = false

        expect(validator).to receive(:valid_advance?).with('white', start, destination, true).and_return(false)
        expect(white_pawn.valid_move?(start, destination, capture)).to be false
      end
    end

    context 'when capturing' do
      it 'returns true for a valid capture move' do
        start = [6, 1]
        destination = [5, 2]
        capture = true

        expect(validator).to receive(:valid_capture?).with('black', start, destination).and_return(true)
        expect(black_pawn.valid_move?(start, destination, capture)).to be true
      end

      it 'returns false for an invalid capture move' do
        start = [6, 1]
        destination = [5, 1]
        capture = true

        expect(validator).to receive(:valid_capture?).with('black', start, destination).and_return(false)
        expect(black_pawn.valid_move?(start, destination, capture)).to be false
      end
    end
  end

  describe '#move' do
    it 'changes the first_move attribute to false' do
      white_pawn.move
      expect(white_pawn.instance_variable_get(:@first_move)).to be false
    end
  end
end
