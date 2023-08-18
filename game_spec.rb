# frozen_string_literal: true

# game_spec.rb
require 'game'
require 'board'
require 'validator'
require 'move'
require 'player'

RSpec.describe Game do
  let(:player1) { Player.new('white', 'Player 1') }
  let(:player2) { Player.new('black', 'Player 2') }
  let(:game) { Game.new(player1, player2) }

  before do
    allow($stdout).to receive(:puts)
    allow($stdout).to receive(:print)
  end

  describe '#start' do
    it 'sets up the initial board and starts the game loop' do
      allow(game).to receive(:print_board)
      allow(game).to receive(:get_player_move).and_return(nil)

      expect(game).to receive(:print_board)
      expect(game).to receive(:get_player_move).and_return(nil)

      game.start
    end
  end

  describe '#parse_move' do
    it 'parses a valid move input' do
      move_input = 'a2 to a4'
      parsed_move = game.send(:parse_move, move_input)

      expect(parsed_move).to be_a(Move)
    end

    it 'returns nil for invalid move input' do
      move_input = 'invalid input'
      parsed_move = game.send(:parse_move, move_input)

      expect(parsed_move).to be_nil
    end
  end

  describe '#parse_position' do
    it 'parses a valid position input' do
      position_input = 'a2'
      parsed_position = game.send(:parse_position, position_input)

      expect(parsed_position).to eq([1, 0])
    end

    it 'returns nil for invalid position input' do
      position_input = 'invalid position'
      parsed_position = game.send(:parse_position, position_input)

      expect(parsed_position).to be_nil
    end
  end

  describe '#valid_move?' do
    it 'calls valid? on the move object' do
      move = double('move')
      allow(move).to receive(:valid?).and_return(true)

      result = game.send(:valid_move?, move)

      expect(result).to be true
    end
  end

  describe '#execute_move' do
    it 'calls execute on the move object' do
      move = double('move')
      allow(move).to receive(:execute)

      game.send(:execute_move, move)

      expect(move).to have_received(:execute)
    end
  end

  describe '#switch_players' do
    it 'switches the current player' do
      initial_player = game.send(:current_player)
      game.send(:switch_players)
      switched_player = game.send(:current_player)

      expect(switched_player).not_to eq(initial_player)
    end
  end
end
