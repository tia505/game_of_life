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
        # Neighbor counts:
        # 0, 1, 4+ -> die
        # 2 -> stay alive
        # 3 -> alive
        count = neighbor_count

        # binding.pry

        # Don't need to check 2 since status will stay the same either way.
        if [0, 1, 4].include? count
            @alive = false
        elsif count == 3
            @alive = true
        end
    end

    def neighbor_count
        count = 0
        
        NEIGHBORS.each do |coord|
            x = coord[0] + @x
            y = coord[1] + @y
            # puts "#{x} #{y}"

            # Skip if out of board boundary
            next if [-1, @board.width].include? x
            next if [-1, @board.height].include? y

            count += 1 if @board.cell_at(x, y).alive?
            break if count == 4 # Don't have to count all the neighbors, 4 can be max.
            # TODO: Check if this break is faster than simply comparing to [0, 1, 4, 5, 6, 7, 8] in update_status
        end

        count
    end
end