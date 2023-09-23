require './spec/spec_helper.rb'
require_relative '../../app/models/cell'
require_relative '../../app/models/board'

describe Cell do
    let(:board) { Board.new(3,4) }
    let(:x) {1}
    let(:y) {2}
    let(:cell) { Cell.new(board, x, y) }
    
    context 'when initialized' do
        it 'coordinates are set' do
            expect(cell.x).to eq(x)
            expect(cell.y).to eq(y)
        end

        it 'defaults to dead' do
            expect(cell.alive?).to be_falsey
            expect(cell.dead?).to be_truthy
        end
    end
    
    describe '#update_status' do
        subject{ cell.update_status }

        context 'Rule #1: Any live cell with fewer than two live neighbours dies' do
        end

        context 'Rule #2: Any live cell with two or three live neighbours lives on to the next generation' do
        end

        context 'Rule #3: Any live cell with more than three live neighbours dies, as if by overpopulation' do
        end

        context 'Rule #4: Any dead cell with exactly three live neighbours becomes a live cell' do
            before do
                board.cell_at(x,y-1).alive = true
                board.cell_at(x,y+1).alive = true
                board.cell_at(x+1,y).alive = true
            end

            it 'becomes alive' do
                expect{ subject }.to change{ cell.alive? }.from(false).to(true)
            end
        end
    end

    describe '#neighbor_count' do
        context 'when neighbors are dead' do
        end

        context 'when neighbors are alive' do
            it 'will return 1 when single alive neighbor' do
            end

            it 'will return 4 when four or more alive neighbors' do
            end
        end
    end
end