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

        context 'with dead neighbors' do
        end

        context 'with 3 alive neighbors' do
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


    # TODO: All the rules
end