require_relative "pieces"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    setup
  end

  def setup
    (0...8).each do |col|
      @grid[0][col] = Knight.new(:black, self, [0,col])
      @grid[1][col] = Queen.new(:black, self, [1,col])
      @grid[2][col] = NullPiece.new
      @grid[3][col] = NullPiece.new
      @grid[4][col] = NullPiece.new
      @grid[5][col] = NullPiece.new
      @grid[6][col] = Bishop.new(:white, self, [6,col])
      @grid[7][col] = Knight.new(:white, self, [7,col])
    end


  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row,col,piece)
    @grid[row][col] = piece
  end

  def move_piece(start_pos, end_pos)



    if !self[*start_pos].empty? && self[*end_pos].empty? && self[*start_pos].moves.include?(end_pos)

        self[*start_pos].pos = end_pos
        #  swap positions of pieces on board
        self[*start_pos], self[*end_pos] = self[*end_pos], self[*start_pos]
    elsif self[*start_pos].empty?
      raise ArgumentError, "There is no chess piece at #{start_pos}"
    elsif !self[*end_pos].empty?
      raise ArgumentError, "Ending position #{end_pos} is not empty"
    end
  end
end
