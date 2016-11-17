require_relative 'board'
require_relative 'tile'
require 'byebug'

class Game
  def initialize
    @board = Board.nine_by_nine
  end

  def run
    #until over?
      render
      #get_input
      #update_board
    #end

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
        print " #{tile} "
      end
      puts ""
    end
  end


  def get_input

  end



  def over?

  end

end


if $PROGRAM_NAME == __FILE__
  game = Game.new
  game.run

end
