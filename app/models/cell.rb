class Cell
    attr_accessor :x, :y, :alive

    NEIGHBORS = [
        [-1, 1],  [0, 1],  [1, 1],
        [-1, 0],           [1, 0],
        [-1, -1], [0, -1], [1, -1]
    ]
    
    def initialize(board, x, y, alive=false)
        @board = board
        @x = x
        @y = y
        @alive = alive
    end
    
    def alive?
        @alive
    end
    
    def dead?
        !@alive
    end
    
    def update_status
        count = neighbor_count
        
        # Neighbor counts:
        # 0, 1, 4+ -> die
        # 2 -> stay alive (cell state remains the same)
        # 3 -> alive
        if [0, 1, 4].include? count
            @alive = false
        elsif count == 3
            @alive = true
        end
    end

    private

    def neighbor_count
        count = 0
        
        NEIGHBORS.each do |coord|
            x = coord[0] + @x
            y = coord[1] + @y

            # Skip if outside of board boundary
            next if [-1, @board.width].include? x
            next if [-1, @board.height].include? y

            count += 1 if @board.cell_at(x, y).alive?
            break if count == 4 # Don't have to count all the neighbors, 4+ dies.
        end

        count
    end
end