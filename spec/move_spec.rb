# frozen_string_literal: true

require 'move'
require 'validator'
require 'pawn'

RSpec.describe Move do
  let(:validator) { Validator.new }
  let(:white_pawn) { Pawn.new('white', validator) }
  let(:black_pawn) { Pawn.new('black', validator) }
  let(:white_move) { Move.new(white_pawn, validator) }
  let(:black_move) { Move.new(black_pawn, validator) }

  describe '#valid_move?' do
    context 'when not capturing' do
      it 'returns true for a valid advance move' do
        start = [1, 1]
        destination = [2, 1]
        capture = false

        allow(validator).to receive(:valid_advance?).with('white', start, destination, true).and_return(true)

        expect(white_move.valid_move?(start, destination, capture)).to be true
      end

      it 'returns false for an invalid advance move' do
        start = [1, 1]
        destination = [3, 1]
        capture = false

        allow(validator).to receive(:valid_advance?).with('white', start, destination, true).and_return(false)

        expect(white_move.valid_move?(start, destination, capture)).to be false
      end
    end

    context 'when capturing' do
      it 'returns true for a valid capture move' do
        start = [6, 1]
        destination = [5, 2]
        capture = true

        allow(validator).to receive(:valid_capture?).with('black', start, destination).and_return(true)

        expect(black_move.valid_move?(start, destination, capture)).to be true
      end

      it 'returns false for an invalid capture move' do
        start = [6, 1]
        destination = [5, 1]
        capture = true

        allow(validator).to receive(:valid_capture?).with('black', start, destination).and_return(false)

        expect(black_move.valid_move?(start, destination, capture)).to be false
      end
    end
  end

  describe '#execute_move' do
    it 'executes the move when it is valid' do
      start = [1, 1]
      destination = [2, 1]
      capture = false

      allow(white_move).to receive(:valid_move?).with(start, destination, capture).and_return(true)
      allow(white_pawn).to receive(:position=)
      allow(white_pawn).to receive(:first_move=)

      white_move.execute_move(start, destination, capture)

      expect(white_pawn).to have_received(:position=).with(destination)
      expect(white_pawn).to have_received(:first_move=).with(false)
    end

    it 'does not execute the move when it is invalid' do
      start = [1, 1]
      destination = [3, 1]
      capture = false

      allow(white_move).to receive(:valid_move?).with(start, destination, capture).and_return(false)
      allow(white_pawn).to receive(:position=)
      allow(white_pawn).to receive(:first_move=)

      expect { white_move.execute_move(start, destination, capture) }.to raise_error('Invalid move')

      expect(white_pawn).not_to have_received(:position=)
      expect(white_pawn).not_to have_received(:first_move=)
    end
  end
end
