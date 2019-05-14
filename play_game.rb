require_relative "./lib/board.rb"
require_relative "./lib/display.rb"

class Chess
  def initialize
    @board = Board.new
    @display = Display.new(board)
    @game_over = false
    @movement = []
  end

  def play
    until @game_over

      @display.render
      input = @display.cursor.get_input
      move_piece?(input)
    end
  end

  def move_piece?(input)
    return unless input
    if @movement.empty?
      @movement << input
    elsif @movement.count == 1
      @movement << input
      @board.move_piece(*@movement)
      @movement = []
    end
  end

  private
  attr_reader :board, :display

end


game = Chess.new
game.play