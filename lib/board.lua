local Board
do
  local _class_0
  local _base_0 = {
    cell_at = function(self, given_cell)
      if given_cell == "a1" then
        return board.a1
      end
      if given_cell == "a2" then
        return board.a2
      end
      if given_cell == "a3" then
        return board.a3
      end
      if given_cell == "b1" then
        return board.b1
      end
      if given_cell == "b2" then
        return board.b2
      end
      if given_cell == "b3" then
        return board.b3
      end
      if given_cell == "c1" then
        return board.c1
      end
      if given_cell == "c2" then
        return board.c2
      end
      if given_cell == "c3" then
        return board.c3
      end
    end,
    render2 = function(self)
      love.graphics.line((self.x + self.size / 3), self.y, (self.x + self.size / 3), (self.y + self.size))
      love.graphics.line((self.x + self.size * 2 / 3), self.y, (self.x + self.size * 2 / 3), (self.y + self.size))
      love.graphics.line(self.x, (self.y + self.size / 3), (self.x + self.size), (self.y + self.size / 3))
      return love.graphics.line(self.x, (self.y + self.size * 2 / 3), (self.x + self.size), (self.y + self.size * 2 / 3))
    end,
    render = function(self)
      love.graphics.rectangle("line", self.x, self.y, self.size, self.size / 3)
      love.graphics.rectangle("line", self.x, self.y + (self.size * 1 / 3), self.size, self.size / 3)
      love.graphics.rectangle("line", self.x, self.y + (self.size * 2 / 3), self.size, self.size / 3)
      love.graphics.rectangle("line", self.x, self.y, self.size / 3, self.size)
      love.graphics.rectangle("line", self.x + (self.size * 1 / 3), self.y, self.size / 3, self.size)
      love.graphics.rectangle("line", self.x + (self.size * 2 / 3), self.y, self.size / 3, self.size)
      love.graphics.print("1", self.x + (self.size * 1 / 6), self.y - (self.size * 1 / 10), 0, 1.5)
      love.graphics.print("2", self.x + (self.size * 3 / 6), self.y - (self.size * 1 / 10), 0, 1.5)
      love.graphics.print("3", self.x + (self.size * 5 / 6), self.y - (self.size * 1 / 10), 0, 1.5)
      love.graphics.print("a", self.x - (self.size * 1 / 10), self.y + (self.size * 1 / 6), 0, 1.5)
      love.graphics.print("b", self.x - (self.size * 1 / 10), self.y + (self.size * 3 / 6), 0, 1.5)
      return love.graphics.print("a", self.x - (self.size * 1 / 10), self.y + (self.size * 5 / 6), 0, 1.5)
    end,
    place = function(self, piece, given_cell)
      local cell = self:cell_at(given_cell)
      if piece == "o" and not cell.has_x then
        love.graphics.setColor(255, 100, 0)
        return love.graphics.circle("line", cell.x, cell.y, (self.size / 8), 50)
      elseif piece == "x" and not cell.has_o then
        love.graphics.setColor(100, 100, 255)
        love.graphics.line((cell.x - self.size / 10), (cell.y - self.size / 10), (cell.x + self.size / 10), (cell.y + self.size / 10))
        return love.graphics.line((cell.x + self.size / 10), (cell.y - self.size / 10), (cell.x - self.size / 10), (cell.y + self.size / 10))
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y, size)
      self.x, self.y, self.size = x, y, size
      self.a1 = {
        x = self.x + (self.size * 1 / 6),
        y = self.y + (self.size * 1 / 6),
        has_piece = false,
        has_x = false,
        has_o = false
      }
      self.a2 = {
        x = self.x + (self.size * 3 / 6),
        y = self.y + (self.size * 1 / 6),
        has_piece = false,
        has_x = false,
        has_o = false
      }
      self.a3 = {
        x = self.x + (self.size * 5 / 6),
        y = self.y + (self.size * 1 / 6),
        has_piece = false,
        has_x = false,
        has_o = false
      }
      self.b1 = {
        x = self.x + (self.size * 1 / 6),
        y = self.y + (self.size * 3 / 6),
        has_piece = false,
        has_x = false,
        has_o = false
      }
      self.b2 = {
        x = self.x + (self.size * 3 / 6),
        y = self.y + (self.size * 3 / 6),
        has_piece = false,
        has_x = false,
        has_o = false
      }
      self.b3 = {
        x = self.x + (self.size * 5 / 6),
        y = self.y + (self.size * 3 / 6),
        has_piece = false,
        has_x = false,
        has_o = false
      }
      self.c1 = {
        x = self.x + (self.size * 1 / 6),
        y = self.y + (self.size * 5 / 6),
        has_piece = false,
        has_x = false,
        has_o = false
      }
      self.c2 = {
        x = self.x + (self.size * 3 / 6),
        y = self.y + (self.size * 5 / 6),
        has_piece = false,
        has_x = false,
        has_o = false
      }
      self.c3 = {
        x = self.x + (self.size * 5 / 6),
        y = self.y + (self.size * 5 / 6),
        has_piece = false,
        has_x = false,
        has_o = false
      }
    end,
    __base = _base_0,
    __name = "Board"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Board = _class_0
  return _class_0
end
