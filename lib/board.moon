-- cell = board.cell_at 1,1
-- cell.x, cell.y

class Board
	new: (@x, @y, @size) =>

	--cells
		@a1 = {
			x: @x + (@size*1/6)
			y: @y + (@size*1/6)
			has_x: false
			has_o: false
		}

		@a2 = {
			x: @x + (@size*3/6)
			y: @y + (@size*1/6)
			has_x: false
			has_o: false
		}

		@a3 = {
			x: @x + (@size*5/6)
			y: @y + (@size*1/6)
			has_x: false
			has_o: false
		}



		@b1 = {
			x: @x + (@size*1/6)
			y: @y + (@size*3/6)
			has_x: false
			has_o: false
		}

		@b2 = {
			x: @x + (@size*3/6)
			y: @y + (@size*3/6)
			has_x: false
			has_o: false
		}

		@b3 = {
			x: @x + (@size*5/6)
			y: @y + (@size*3/6)
			has_x: false
			has_o: false
		}



		@c1 = {
			x: @x + (@size*1/6)
			y: @y + (@size*5/6)
			has_x: false
			has_o: false
		}

		@c2 = {
			x: @x + (@size*3/6)
			y: @y + (@size*5/6)
			has_x: false
			has_o: false
		}

		@c3 = {
			x: @x + (@size*5/6)
			y: @y + (@size*5/6)
			has_x: false
			has_o: false
		}



	cell_at: (given_cell) =>
		if given_cell == "a1"
    		return board.a1
		if given_cell == "a2"
		    return board.a2
		if given_cell == "a3"
		    return board.a3
		if given_cell == "b1"
		    return board.b1
		if given_cell == "b2"
		    return board.b2
		if given_cell == "b3"
		    return board.b3
		if given_cell == "c1"
		    return board.c1
		if given_cell == "c2"
		    return board.c2
		if given_cell == "c3"
		    return board.c3

	render2: =>
		--love.graphics.setColor 255, 255, 255

		-- horizontal lines
		love.graphics.line (@x + @size/3), @y, (@x + @size/3), (@y+@size)
		love.graphics.line (@x + @size*2/3), @y, (@x + @size*2/3), (@y+@size)

		-- vertical lines
		love.graphics.line @x, (@y + @size/3), (@x + @size), (@y + @size/3)
		love.graphics.line @x, (@y + @size*2/3), (@x + @size), (@y + @size*2/3)

		---- grid labels
		--love.graphics.print "1", @x + (@size*1/6), @y - (@size*1/10), 0, 1.5
		--love.graphics.print "2", @x + (@size*3/6), @y - (@size*1/10), 0, 1.5
		--love.graphics.print "3", @x + (@size*5/6), @y - (@size*1/10), 0, 1.5
--
		--love.graphics.print "a", @x - (@size*1/10), @y + (@size*1/6), 0, 1.5
		--love.graphics.print "b", @x - (@size*1/10), @y + (@size*3/6), 0, 1.5
		--love.graphics.print "a", @x - (@size*1/10), @y + (@size*5/6), 0, 1.5

	render: =>
		--love.graphics.setColor 255, 255, 255

		-- horizontal rectangles
		love.graphics.rectangle "line", @x, @y, @size, @size/3

		love.graphics.rectangle "line", @x, @y+(@size*1/3), @size, @size/3

		love.graphics.rectangle "line", @x, @y+(@size*2/3), @size, @size/3

		-- vertical rectangles
		love.graphics.rectangle "line", @x, @y, @size/3, @size

		love.graphics.rectangle "line", @x+(@size*1/3), @y, @size/3, @size

		love.graphics.rectangle "line", @x+(@size*2/3), @y, @size/3, @size


		-- grid labels
		love.graphics.print "1", @x + (@size*1/6), @y - (@size*1/10), 0, 1.5
		love.graphics.print "2", @x + (@size*3/6), @y - (@size*1/10), 0, 1.5
		love.graphics.print "3", @x + (@size*5/6), @y - (@size*1/10), 0, 1.5

		love.graphics.print "a", @x - (@size*1/10), @y + (@size*1/6), 0, 1.5
		love.graphics.print "b", @x - (@size*1/10), @y + (@size*3/6), 0, 1.5
		love.graphics.print "a", @x - (@size*1/10), @y + (@size*5/6), 0, 1.5



	place: (piece, given_cell) =>
    	cell = @cell_at given_cell
    	
    	if piece == "o" and not cell.has_x 
    		love.graphics.setColor 255, 100, 0

    	    love.graphics.circle "line", cell.x, cell.y, (@size/8), 50
	
    	elseif piece == "x" and not cell.has_o
    		love.graphics.setColor 100, 100, 255

    	    love.graphics.line (cell.x - @size/10), 
    	        (cell.y - @size/10), 
    	        (cell.x + @size/10), 
    	        (cell.y + @size/10)
    	    love.graphics.line (cell.x + @size/10), 
    	        (cell.y - @size/10), 
    	        (cell.x - @size/10), 
    	        (cell.y + @size/10)


