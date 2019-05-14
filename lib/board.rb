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
      @grid[1][col] = Knight.new(:black, self, [1,col])
      @grid[2][col] = NullPiece.new(:white, self, [2,col])
      @grid[3][col] = NullPiece.new(:white, self, [3,col])
      @grid[4][col] = NullPiece.new(:white, self, [4,col])
      @grid[5][col] = NullPiece.new(:white, self, [5,col])
      @grid[6][col] = Knight.new(:white, self, [6,col])
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
    start_piece = self[*start_pos]
    end_piece = self[*end_pos]

    if !start_piece.empty? && end_piece.empty? && start_piece.moves.include?(end_pos)

        # swap position values
        start_piece.pos, end_piece.pos = end_pos, start_pos
        #  swap positions
        self[*start_pos], self[*end_pos] = self[*end_pos], self[*start_pos]
    elsif self[*start_pos].empty?
      raise ArgumentError, "There is no chess piece at #{start_pos}"
    elsif !self[*end_pos].empty?
      raise ArgumentError, "Ending position #{end_pos} is not empty"
    end
  end
end
