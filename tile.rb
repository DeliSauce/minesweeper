class Tile

  TILE_STATUS = {unexplored: "*", flagged: "F", interior: "_"}

  def initialize(board, bombed)
    @board = board
    @bombed = bombed

    @flagged = false
    @revealed = false
    @bomb_proximity_count = nil
  end


  def reveal

  end

  def status
    @revealed ? "_" : "*"
  end

  def cheat_status
    @bombed ? "X" : "*"
  end

  def neighbors

  end


  def neighbor_bomb_count

  end


end
