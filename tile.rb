class Tile

  TILE_STATUS = {unexplored: "*", flagged: "F", interior: "_"}

  def initialize(board, bombed)
    @board = board
    @bombed = bombed

    @flagged = false
    @revealed = false
    @bomb_proximity_count = nil
  end

  attr_accessor :bombed

  def reveal
    @revealed = true
  end

  def status
    if @revealed
      @bombed ? "X" : " "
    else
      "*"
    end
  end

  def to_string
    "tile at #{self.position}"
  end

  def position
    @board.each.with_index do |row, i|
      row.each.with_index do |tile, j|
        return [i, j] if self == tile
      end
    end
  end

  #need to create and array of 9 neighbors
  # def neighbors
  #   tile_neighbors = []
  #   x, y = self.position
  #   x_inc = -1
  #   3.times do
  #     y_inc = -1
  #     x_inc += 1
  #     3.times do
  #       unless x_inc == 0 && y_inc == 0
  #         row = x + x_inc
  #         col = y + y_inc
  #         coord = [row, col]
  #         p coord
  #         p @board.tiles[row][col]
  #         # p @board[coord]
  #         tile_neighbors << @board[row, col]
  #       end
  #       y_inc += 1
  #     end
  #   end
  #   tile_neighbors
  # end


  def cheat_status
    if @revealed
      " "
    else
      @bombed ? "X" : "*"
    end
  end



  def neighbor_bomb_count

  end


end
