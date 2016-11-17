require_relative 'tile'

class Board

  TILE_STATUS = {unexplored: "*", flagged: "F", }

  def initialize(tiles)
    @tiles = tiles
  end

  attr_accessor :tiles

  def self.nine_by_nine
    tiles = Array.new(9) {Array.new(9){"X"}}
    #need to update so that tiles is populated with tiles
    Board.new(tiles)
  end


end
