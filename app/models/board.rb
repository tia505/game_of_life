require './app/models/cell.rb'

class Board
    attr_reader :height, :width, :cells

    def initialize(height, width)
        @width = width
        @height = height
        @cells = []
        
        @width.times do |x| # This 2D matrix will be transposed. Gives us the ability to do @cells[x][y] for any cell status.
            @cells << []
            @height.times do |y|
                @cells[x] << Cell.new(self, x, y)
            end
        end
    end

    def cell_at(x, y)
        @cells[x][y]
    end

    private

    def next_generation
        # Look at each cell's neighbors and see whether this cell is alive or dead now.
        @cells.each do |row|
            row.each do |cell|
                cell.update_status
            end
        end
    end
end
