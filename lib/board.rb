require_relative "pieces"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    setup
  end

  def setup
    (0...8).each do |col|
      @grid[0][col] = Knight.new(:black, self, [0,0])
      @grid[1][col] = Knight.new(:black, self, [0,0])
      @grid[2][col] = NullPiece.new(:white, self, [0,0])
      @grid[3][col] = NullPiece.new(:white, self, [0,0])
      @grid[4][col] = NullPiece.new(:white, self, [0,0])
      @grid[5][col] = NullPiece.new(:white, self, [0,0])
      @grid[6][col] = Knight.new(:white, self, [0,0])
      @grid[7][col] = Knight.new(:white, self, [0,0])
    end


  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row,col,piece)
    @grid[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    if !self[*start_pos].empty? && self[*end_pos].empty?
      # swap position values
      self[*start_pos].pos, self[*end_pos].pos = end_pos, start_pos
      #  swap positions
      self[*start_pos], self[*end_pos] = self[*end_pos], self[*start_pos]

    elsif self[*start_pos].empty?
      raise ArgumentError, "There is no chess piece at #{start_pos}"
    elsif self[*end_pos].empty?
      raise ArgumentError, "Ending position #{end_pos} is not empty"
    end
  end
end
