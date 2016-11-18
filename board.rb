require_relative 'tile'

class Board
  BOMBS = 1

  def initialize(grid)
    #tiles is currently a 2D array of nils
    @tiles = grid
    @grid_size = @tiles.size
    populate_board
  end

  attr_accessor :tiles

  def self.nine_by_nine
    grid = Array.new(9) { Array.new(9) }
    Board.new(grid)
  end

  def [](pos)
    row, col = pos
    @tiles[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @tiles[row][col] = value
  end

  def populate_board
    collection = collection_of_tiles

    @grid_size.times do |row|
      @grid_size.times do |col|
        @tiles[row][col] = collection.pop
      end
    end
  end

  def collection_of_tiles
    bombs_left = BOMBS
    collection = []
    (@grid_size * @grid_size).times do
      collection << (bombs_left >= 0 ? Tile.new(@tiles, true) : Tile.new(@tiles, false))
      bombs_left -= 1
    end
    collection.shuffle
  end


end
