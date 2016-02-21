local Cell
do
  local _class_0
  local _base_0 = { }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x_factor, y_factor, board)
      self.x_factor, self.y_factor, self.board = x_factor, y_factor, board
      self.x = self.board.x + (self.board.size * self.x_factor)
      self.y = self.board.y + (self.board.size * self.y_factor)
      self.has_x = false
      self.has_o = false
    end,
    __base = _base_0,
    __name = "Cell"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Cell = _class_0
  return _class_0
end
