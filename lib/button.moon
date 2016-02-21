class Button
	new: (@text, @x, @y, @w, @h) =>

		@text_pos = {
			x: @x + 5
			y: (@y + (@h/2)) - 7
		}

		@pressed = false

	press: =>
		if @pressed = false
			@pressed = true
		else
			@pressed = false

	moused_over: (mouse_x, mouse_y) =>
	
    	if mouse_x > @x and
    	    mouse_x < @x + @w and
    	    mouse_y > @y and
    	    mouse_y < @y + @h
	
    	    return true

	draw: =>
		unless @pressed
			love.graphics.setColor 255, 255, 255
			love.graphics.print @text, @text_pos.x, @text_pos.y
			love.graphics.rectangle "line", @x, @y, @w, @h
		else
			love.graphics.setColor 255, 255, 255
			love.graphics.rectangle "fill", @x, @y, @w, @h
			love.graphics.setColor 0, 0, 0
			love.graphics.print @text, @text_pos.x, @text_pos.y
			love.graphics.setColor 255, 255, 255

	