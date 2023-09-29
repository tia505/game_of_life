require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:height) {4}
  let(:width) {3}
  let(:board) { Board.new(height, width) }

  context 'when initialized' do
    it 'creates a board with height and width' do
      expect(board.height).to eq(height)
      expect(board.width).to eq(width)
    end

    it 'creates a dead cells for the board size' do
      expect(board.cells[0].size).to eq(height)
      expect(board.cells.size).to eq(width)
      expect(board.cells.flatten.all?(Cell)).to be_truthy
      expect(board.cells.flatten.all?(&:alive?)).to be_falsey
    end
  end

  describe '#cell_at' do
    let(:x) {2}
    let(:y) {1}
    
    it 'returns the cell matching the given coordinates' do
      expect(board.cell_at(x, y)).to eq(board.cells[x][y])
    end
  end
end
