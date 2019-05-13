require_relative "piece"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    setup
  end

  def setup
    (0...8).each do |col|
      @grid[0][col] = Piece.new
      @grid[1][col] = Piece.new
      @grid[6][col] = Piece.new
      @grid[7][col] = Piece.new
    end
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row,col,piece)
    @grid[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    if self[*start_pos].is_a?(Piece) && self[*end_pos].nil?
      self[*start_pos], self[*end_pos] = self[*end_pos], self[*start_pos]
    elsif !self[*start_pos].is_a?(Piece)
      raise ArgumentError, "There is no chess piece at #{start_pos}"
    elsif self[*end_pos]
      raise ArgumentError, "Ending position #{end_pos} is not empty"
    end
  end
end
