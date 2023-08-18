# frozen_string_literal: true

# player_spec.rb
require 'player'

RSpec.describe Player do
  let(:player) { Player.new('Leo', 'white') }

  describe '#initialize' do
    it 'creates a player with a name' do
      expect(player.name).to eq('Leo')
    end

    it 'creates a player with a color' do
      expect(player.color).to eq('white')
    end

    it 'initializes player with an empty array of moves' do
      expect(player.moves).to be_empty
    end
  end

  describe '#add_move' do
    it 'adds a move to the player' do
      move = instance_double('Move')
      player.add_move(move)
      expect(player.moves).to include(move)
    end
  end

  describe '#clear_moves' do
    it 'clears the moves for the player' do
      move = instance_double('Move')
      player.add_move(move)
      player.clear_moves
      expect(player.moves).to be_empty
    end
  end

  describe '#has_moves?' do
    it 'returns true if the player has moves' do
      move = instance_double('Move')
      player.add_move(move)
      expect(player.has_moves?).to be true
    end

    it 'returns false if the player has no moves' do
      expect(player.has_moves?).to be false
    end
  end

  describe '#next_move' do
    it 'returns the next move from the moves array' do
      move1 = instance_double('Move')
      move2 = instance_double('Move')
      player.add_move(move1)
      player.add_move(move2)
      expect(player.next_move).to eq(move1)
      expect(player.moves).to eq([move2])
    end
  end
end
