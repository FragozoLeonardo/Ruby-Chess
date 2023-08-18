# frozen_string_literal: true

require './lib/queen'
require './lib/validator'

RSpec.describe Queen do
  let(:validator) { instance_double(Validator) }
  let(:white_queen) { Queen.new('white', validator) }
  let(:black_queen) { Queen.new('black', validator) }

  describe '#valid_move?' do
    context 'when moving like a rook' do
      it 'returns true for a valid rook move' do
        start = [1, 1]
        destination = [5, 1]

        expect(validator).to receive(:valid_queen_move?).with(start, destination).and_return(true)
        expect(white_queen.valid_move?(start, destination)).to be true
      end

      it 'returns false for a non-rook move' do
        start = [1, 1]
        destination = [2, 2]

        expect(validator).to receive(:valid_queen_move?).with(start, destination).and_return(false)
        expect(white_queen.valid_move?(start, destination)).to be false
      end
    end

    context 'when moving like a bishop' do
      it 'returns true for a valid bishop move' do
        start = [1, 1]
        destination = [4, 4]

        expect(validator).to receive(:valid_queen_move?).with(start, destination).and_return(true)
        expect(white_queen.valid_move?(start, destination)).to be true
      end

      it 'returns false for a non-bishop move' do
        start = [1, 1]
        destination = [5, 2]

        expect(validator).to receive(:valid_queen_move?).with(start, destination).and_return(false)
        expect(white_queen.valid_move?(start, destination)).to be false
      end
    end

    context 'when moving neither like a rook nor a bishop' do
      it 'returns false for a vertical move' do
        start = [1, 1]
        destination = [5, 1]

        expect(validator).to receive(:valid_queen_move?).with(start, destination).and_return(false)
        expect(white_queen.valid_move?(start, destination)).to be false
      end

      it 'returns false for a horizontal move' do
        start = [1, 1]
        destination = [1, 5]

        expect(validator).to receive(:valid_queen_move?).with(start, destination).and_return(false)
        expect(white_queen.valid_move?(start, destination)).to be false
      end
    end
  end
end
