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

    context 'invalid moves' do
      it 'wont allow you to use a row not on the board' do
        expect{ game.play(4, 1) }.to raise_error "This row doesn't exist!"
      end

      it 'wont allow you to use a column not on the board' do
        expect{ game.play(1, 4) }.to raise_error "This column doesn't exist!"
      end

      it 'wont allow you to take and already filled space' do
        game.play(1, 1)
        expect{ game.play(1, 1) }.to raise_error "This space is filled!"
      end
    end

    context 'Game over, no winner' do
       before do
         game.row_one =  ['X', 'O', 'X']
         game.row_two =  ['O', 'X', 'O']
         game.row_three = ['O', 'X', '-']
       end
      it 'raises game over when all spaces are filled' do
        expect{ game.play(3, 3) }.to raise_error "Game Over!"
      end
    end

    context 'Game over, winner!' do
      before do
        game.row_one =  ['X', '-', 'X']
        game.row_two =  ['X', 'X', 'O']
        game.row_three = ['-', '-', '-']
      end
      it 'recoginises a row win' do
        expect{ game.play(1, 2) }.to raise_error "X wins!"
      end

      it 'recoginises a column win' do
        expect{ game.play(3, 1) }.to raise_error "X wins!"
      end

      it 'recoginises a diagonal win' do
        expect{ game.play(3, 3) }.to raise_error "X wins!"
      end
    end
  end
end
