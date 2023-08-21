# frozen_string_literal: true

require 'move'
require 'validator'
require 'piece'

RSpec.describe Move do
  let(:validator) { Validator.new }

  describe '#valid_move?' do
    context 'when not capturing' do
      it 'delegates to the piece for valid move' do
        pawn = Pawn.new('white', validator)
        start = [1, 1]
        destination = [2, 1]
        move = Move.new(pawn, validator, start, destination)

        allow(validator).to receive(:valid_pawn_move?).with(start, destination).and_return(true)

        expect(move.valid_move?).to be true
      end

      it 'delegates to the piece for invalid move' do
        pawn = Pawn.new('white', validator)
        start = [1, 1]
        destination = [3, 1]
        move = Move.new(pawn, validator, start, destination)

        allow(validator).to receive(:valid_pawn_move?).with(start, destination).and_return(false)

        expect(move.valid_move?).to be false
      end
    end

    context 'when capturing' do
      it 'delegates to the piece for valid capture move' do
        pawn = Pawn.new('white', validator)
        start = [1, 1]
        destination = [2, 2] # Capturing move
        move = Move.new(pawn, validator, start, destination)

        allow(validator).to receive(:valid_pawn_move?).with(start, destination).and_return(true)

        expect(move.valid_move?(true)).to be true
      end

      it 'delegates to the piece for invalid capture move' do
        pawn = Pawn.new('white', validator)
        start = [1, 1]
        destination = [2, 2] # Capturing move
        move = Move.new(pawn, validator, start, destination)

        allow(validator).to receive(:valid_pawn_move?).with(start, destination).and_return(false)

        expect(move.valid_move?(true)).to be false
      end
    end
  end

  describe '#execute_move' do
    it 'executes the move when it is valid' do
      pawn = Pawn.new('white', validator)
      start = [1, 1]
      destination = [2, 1]
      move = Move.new(pawn, validator, start, destination)

      allow(validator).to receive(:valid_pawn_move?).with(start, destination).and_return(true)
      allow(pawn).to receive(:position=)
      allow(pawn).to receive(:first_move=)

      move.execute_move

      expect(pawn).to have_received(:position=).with(destination)
      expect(pawn).to have_received(:first_move=).with(false)
    end

    it 'raises an error and does not execute the move when it is invalid' do
      pawn = Pawn.new('white', validator)
      start = [1, 1]
      destination = [3, 1]
      move = Move.new(pawn, validator, start, destination)

      allow(validator).to receive(:valid_pawn_move?).with(start, destination).and_return(false)
      allow(pawn).to receive(:position=)
      allow(pawn).to receive(:first_move=)

      expect { move.execute_move }.to raise_error('Invalid move')

      expect(pawn).not_to have_received(:position=)
      expect(pawn).not_to have_received(:first_move=)
    end
  end
end
