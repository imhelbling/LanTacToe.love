local Button
do
  local _class_0
  local _base_0 = {
    press = function(self)
      do
        self.pressed = false
        if self.pressed then
          self.pressed = true
        else
          self.pressed = false
        end
      end
    end,
    moused_over = function(self, mouse_x, mouse_y)
      if mouse_x > self.x and mouse_x < self.x + self.w and mouse_y > self.y and mouse_y < self.y + self.h then
        return true
      end
    end,
    draw = function(self)
      if not (self.pressed) then
        love.graphics.setColor(255, 255, 255)
        love.graphics.print(self.text, self.text_pos.x, self.text_pos.y)
        return love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
      else
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
        love.graphics.setColor(0, 0, 0)
        love.graphics.print(self.text, self.text_pos.x, self.text_pos.y)
        return love.graphics.setColor(255, 255, 255)
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, text, x, y, w, h)
      self.text, self.x, self.y, self.w, self.h = text, x, y, w, h
      self.text_pos = {
        x = self.x + 5,
        y = (self.y + (self.h / 2)) - 7
      }
      self.pressed = false
    end,
    __base = _base_0,
    __name = "Button"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Button = _class_0
  return _class_0
end
