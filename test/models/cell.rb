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

        context 'when cell is alive and has alive neighbors' do
            NEIGHBORS_RESULTS = {
                0 => false, # Rule #1: Any live cell with fewer than two live neighbours dies
                1 => false,
                2 => true, # Rule #2: Any live cell with two or three live neighbours lives on to the next generation
                3 => true,
                4 => false, # Rule #3: Any live cell with more than three live neighbours dies, as if by overpopulation
                5 => false,
                6 => false,
                7 => false,
                8 => false
            }

            NEIGHBORS_RESULTS.each do |alive_neighbors, cell_alive|
                it "returns cell alive: #{cell_alive} when there are #{alive_neighbors} alive neighbors" do
                    cell.alive = true
                    activate_neighbors(alive_neighbors)

                    subject
                    expect( cell.alive? ).to eq(cell_alive)
                end
            end
        end
   
        context 'when cell is dead and has alive neighbors' do # Rule #4: Any dead cell with exactly three live neighbours becomes a live cell
            before { activate_neighbors(3) }

            it 'becomes alive' do
                expect{ subject }.to change{ cell.alive? }.from(false).to(true)
            end
        end
    end

    def activate_neighbors(number_of_cells)
        number_of_cells.times do |i|
            neighbor = Cell::NEIGHBORS[i]
            board.cell_at( x + neighbor[0], y + neighbor[1] ).alive = true
        end
    end
end