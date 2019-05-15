class Piece
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end


  def to_s
    " #{symbol} "
  end

  def empty?
    false
  end

  def valid_move?(pos)
    return pos.all? { |coord| coord.between?(0, 7) } && board[*pos].color != @color
  end

  def pos=(val)
    @pos = val
  end

  def symbol
    # subclass implements this with unicode chess char
    raise NotImplementedError
  end

  def inspect
    "#{self.name} at #{@pos}"
  end



end

