# frozen_string_literal: true

require 'validator'

RSpec.describe Validator do
  let(:validator) { Validator.new }

  describe '#valid_advance?' do
    context 'when color is white' do
      it 'returns true for a valid first move' do
        start = [1, 1]
        destination = [3, 1]
        first_move = true

        expect(validator.valid_advance?('white', start, destination, first_move)).to be true
      end

      it 'returns true for a valid non-first move' do
        start = [2, 1]
        destination = [3, 1]
        first_move = false

        expect(validator.valid_advance?('white', start, destination, first_move)).to be true
      end

      it 'returns false for an invalid move' do
        start = [1, 1]
        destination = [4, 1]
        first_move = true

        expect(validator.valid_advance?('white', start, destination, first_move)).to be false
      end
    end

    context 'when color is black' do
      it 'returns true for a valid first move' do
        start = [7, 1]
        destination = [5, 1]
        first_move = true

        expect(validator.valid_advance?('black', start, destination, first_move)).to be true
      end

      it 'returns true for a valid non-first move' do
        start = [6, 1]
        destination = [5, 1]
        first_move = false

        expect(validator.valid_advance?('black', start, destination, first_move)).to be true
      end

      it 'returns false for an invalid move' do
        start = [7, 1]
        destination = [4, 1]
        first_move = true

        expect(validator.valid_advance?('black', start, destination, first_move)).to be false
      end
    end
  end

  describe '#valid_capture?' do
    it 'returns true for a valid capture move' do
      color = 'white'
      start = [1, 1]
      destination = [2, 2]

      expect(validator.valid_capture?(color, start, destination)).to be true
    end

    it 'returns false for an invalid capture move' do
      color = 'white'
      start = [1, 1]
      destination = [3, 1]

      expect(validator.valid_capture?(color, start, destination)).to be false
    end
  end
end
