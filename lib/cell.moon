
class Cell
	new: (@x_factor, @y_factor, @board) =>

		@x = @board.x + (@board.size*@x_factor)
		@y = @board.y + (@board.size*@y_factor)

		@has_x = false
		@has_o = false