require_relative 'piece'
require 'singleton'
class NullPiece < Piece
  include Singleton
  def initialize
  end

  def to_s
    "   "
  end

  def empty?
    true
  end

  def inspect
    "nullpiece"
  end

end