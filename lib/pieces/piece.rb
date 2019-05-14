class Piece
  def initialize

  end

  def to_s
    " P "
  end
end

class NullPiece < Piece
  def to_s
    "   "
  end
end