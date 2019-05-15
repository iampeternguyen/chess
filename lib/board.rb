require_relative "pieces"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    setup
  end

  def setup
    fill_back_row(:white)
    fill_back_row(:black)
    fill_pawns(:white)
    fill_pawns(:black)
  end

  def fill_back_row(color)
    back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    case color
    when :white
      back_row.each_with_index do |piece, col|
        self[7,col] = piece.new(color,self,[7,col])
      end
    when :black
      back_row.each_with_index do |piece, col|
        self[0,col] = piece.new(color,self,[0,col])
      end
    end
  end

  def fill_pawns(color)
    case color
    when :white
      8.times do |col|
        self[6,col] = Pawn.new(color, self, [6,col])
      end
    when :black
      8.times do |col|
        self[1,col] = Pawn.new(color, self, [1,col])
      end
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
