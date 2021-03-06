require "colorize"
require_relative "cursor"

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end

  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      pos = [i,j]
      if pos == @cursor.cursor_pos && @cursor.selected
        piece.to_s.colorize({:background => :green})
      elsif pos == @cursor.cursor_pos
        piece.to_s.uncolorize.colorize({:background => :yellow})
      elsif (i+j).odd?
        piece.to_s.colorize({:background => :blue})
      elsif (i+j).even?
        piece.to_s.colorize({:background => :red})
      end
    end
  end


  def render
    # system('clear')
    build_grid.each do |row|
      puts row.join
    end

  end
end

