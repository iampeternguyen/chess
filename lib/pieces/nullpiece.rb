require_relative 'piece'

class NullPiece < Piece
  def to_s
    "   "
  end

  def empty?
    true
  end
end