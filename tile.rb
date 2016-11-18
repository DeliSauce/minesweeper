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

  def position
    @board.each.with_index do |row, i|
      row.each.with_index do |tile, j|
        return [i, j] if self == tile
      end
    end
  end

  # #need to create and array of 9 neighbors
  # def neighbors
  #   array = []
  #
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
