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

  def valid_moves(pos)
  end

  def pos=(val)
    @pos = val
  end

  def symbol
    # subclass implements this with unicode chess char
    raise NotImplementedError
  end



end

