require './lib/game'

describe Game do

  let(:game) { described_class.new}

  describe 'new game' do
    it 'starts with a blank board' do
      expect(game.row_one).not_to include('X', 'O')
      expect(game.row_two).not_to include('X', 'O')
      expect(game.row_three).not_to include('X', 'O')
    end
  end

  describe '#play' do
    it 'changes the element in the array to current turns symbol' do
      game.play(1, 1)
      expect(game.row_one[0]).to eq 'X'
    end

    it 'swaps the payer over at the end of the turn' do
      game.play(1, 1)
      expect(game.turn.first.to_s).to eq 'O'
    end

    it 'changes over to put Os symbol on the board' do
      game.play(1, 1)
      game.play(1, 2)
      expect(game.row_one[1]).to eq 'O'
    end
  end
end
