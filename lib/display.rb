require "colorize"
require_relative "cursor"

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    8.times do |row|
      8.times do |col|
        pos = [row, col]
        if pos == @cursor.cursor_pos
          print (@board[*pos].to_s + " ").colorize({:color => :black, :background => :blue})
        else
          print @board[*pos].to_s + " "
        end
      end
      print "\n"
    end
  end
end

