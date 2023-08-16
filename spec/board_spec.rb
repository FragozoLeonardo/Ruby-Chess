require './lib/board.rb'

RSpec.describe Board do
  let(:board) { Board.new }
  let(:piece) { double('piece') }
  let(:position) { [0, 0] }

  describe '#initialize' do
    it 'creates an 8x8 grid' do
      expect(board.instance_variable_get(:@grid).size).to eq(8)
      board.instance_variable_get(:@grid).each do |row|
        expect(row.size).to eq(8)
      end
    end
  end

  describe '#place_piece' do
    it 'places a piece on the board at the given position' do
      board.place_piece(piece, position)
      expect(board.get_piece(position)).to eq(piece)
    end
  end

  describe '#get_piece' do
    it 'returns the piece at the given position' do
      board.place_piece(piece, position)
      expect(board.get_piece(position)).to eq(piece)
    end
  end
end
