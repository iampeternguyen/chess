require_relative 'piece'

class NullPiece < Piece

  def initialize
  end
  def to_s
    " x "
  end

  def empty?
    true
  end

  def inspect
    "nullpiece"
  end
end