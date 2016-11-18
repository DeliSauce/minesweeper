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
      #update_board
    end
    render
  end

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
        print " #{tile.status} "
      end
      puts ""
    end
  end


  def over?
    @current_tile.nil? ? false : @current_tile.bombed
  end

end


if $PROGRAM_NAME == __FILE__
  game = Game.new
  game.run

end
