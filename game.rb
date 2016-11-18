require_relative 'board'
require_relative 'tile'
require 'byebug'

class Game
  def initialize
    @board = Board.nine_by_nine
  end

  def run
    until over?
      render
      get_input
      break if @current_tile.bombed
      p @current_tile.position
      #p @current_tile.neighbors.size
      p @current_tile.class
      @current_tile.neighbors.each {|tile| p tile.class}
      #update_adjacent_tiles
    end
    render
  end

  # def update_adjacent_tiles(@current_tile)
  #   neighbors_array = @current_tile.neighbors
  #   unless neighbors.any? { |tile| tile.bombed}
  #     neighbors.each{ |tile| tile.reveal}
  #     #this is the recursion, but have to update it
  #     #update_adjacent_tiles(tile)
  #   end
  # end

  def get_input
    puts "Enter coordinates:"
    coord = gets.chomp.split(",").map(&:to_i)
    @current_tile = @board[coord]
    @current_tile.reveal
  end

  def render
    #debugger
    board_size = @board.tiles.size
    print " "
    board_size.times { |col| print " #{col} " }
    puts ""
    @board.tiles.each.with_index do |row, i|
      print i
      row.each do |tile|
        #will need to update this to accept tile variables
        print " #{tile.cheat_status} "
      end
      puts ""
    end
  end


  def over?
    false
  end

end


if $PROGRAM_NAME == __FILE__
  game = Game.new
  game.run

end
