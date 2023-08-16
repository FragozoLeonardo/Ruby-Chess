# frozen_string_literal: true

# spec/pawn_spec.rb
require 'pawn'

RSpec.describe Pawn do
  let(:validator) { double('validator') }
  let(:white_pawn) { Pawn.new('white', validator) }
  let(:black_pawn) { Pawn.new('black', validator) }

  describe '#valid_move?' do
    context 'when not capturing' do
      it 'delegates to the validator' do
        expect(validator).to receive(:valid_advance?).with('white', [1, 1], [2, 1], true)
        white_pawn.valid_move?([1, 1], [2, 1])
      end
    end

    context 'when capturing' do
      it 'delegates to the validator' do
        expect(validator).to receive(:valid_capture?).with('black', [6, 1], [5, 2])
        black_pawn.valid_move?([6, 1], [5, 2], true)
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
