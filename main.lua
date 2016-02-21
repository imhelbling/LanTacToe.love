local version = "v0.1"
local Board = require("lib.board")
local Cell = require("lib.cell")
local Button = require("lib.button")
love.window.setTitle("LAN Tic-Tac-Toe (" .. tostring(version) .. ")")
local window_width, window_height, flags = love.window.getMode()
local player_piece = "o"
local turn = "o"
local board_size = window_height * 3 / 4
local board_pos_x = (window_width - board_size) / 2
local board_pos_y = (window_height - board_size) / 2
local mouse_x, mouse_y = love.mouse.getPosition()
board = Board(board_pos_x, board_pos_y, board_size)
mute_music_btn = Button("mute music", (window_width - 117), (window_height - 80), 82, 20)
mute_sfx_btn = Button("mute sfx", (window_width - 100), (window_height - 50), 65, 20)
local x_wins = false
local o_wins = false
local airhorn_played = false
local music = love.audio.newSource("audio/clair_delune.mp3", "stream")
local click = love.audio.newSource("audio/click1.mp3", "static")
click:setVolume(0.5)
local airhorn = love.audio.newSource("audio/airhorn.mp3", "static")
airhorn:setVolume(0.3)
local reset
reset = function()
  airhorn:stop()
  x_wins = false
  o_wins = false
  airhorn_played = false
  board.a1.has_x = false
  board.a2.has_x = false
  board.a3.has_x = false
  board.b1.has_x = false
  board.b2.has_x = false
  board.b3.has_x = false
  board.c1.has_x = false
  board.c2.has_x = false
  board.c3.has_x = false
  board.a1.has_o = false
  board.a2.has_o = false
  board.a3.has_o = false
  board.b1.has_o = false
  board.b2.has_o = false
  board.b3.has_o = false
  board.c1.has_o = false
  board.c2.has_o = false
  board.c3.has_o = false
  board.a1.has_piece = false
  board.a2.has_piece = false
  board.a3.has_piece = false
  board.b1.has_piece = false
  board.b2.has_piece = false
  board.b3.has_piece = false
  board.c1.has_piece = false
  board.c2.has_piece = false
  board.c3.has_piece = false
end
local get_cell_for
get_cell_for = function(given_cell)
  return board:cell_at(given_cell)
end
local moused_over
moused_over = function(given_cell)
  local cell = get_cell_for(given_cell)
  if mouse_x > cell.x - board_size / 6 and mouse_x < cell.x + board_size / 6 and mouse_y > cell.y - board_size / 6 and mouse_y < cell.y + board_size / 6 then
    return true
  end
end
local left_clicked
left_clicked = function()
  return love.mouse.isDown(1)
end
local right_clicked
right_clicked = function()
  return love.mouse.isDown(2)
end
local check_for_winner
check_for_winner = function()
  if board.a1.has_x and board.a2.has_x and board.a3.has_x then
    x_wins = true
  end
  if board.b1.has_x and board.b2.has_x and board.b3.has_x then
    x_wins = true
  end
  if board.c1.has_x and board.c2.has_x and board.c3.has_x then
    x_wins = true
  end
  if board.a1.has_x and board.b1.has_x and board.c1.has_x then
    x_wins = true
  end
  if board.a2.has_x and board.b2.has_x and board.c2.has_x then
    x_wins = true
  end
  if board.a3.has_x and board.b3.has_x and board.c3.has_x then
    x_wins = true
  end
  if board.a1.has_x and board.b2.has_x and board.c3.has_x then
    x_wins = true
  end
  if board.a3.has_x and board.b2.has_x and board.c1.has_x then
    x_wins = true
  end
  if board.a1.has_o and board.a2.has_o and board.a3.has_o then
    o_wins = true
  end
  if board.b1.has_o and board.b2.has_o and board.b3.has_o then
    o_wins = true
  end
  if board.c1.has_o and board.c2.has_o and board.c3.has_o then
    o_wins = true
  end
  if board.a1.has_o and board.b1.has_o and board.c1.has_o then
    o_wins = true
  end
  if board.a2.has_o and board.b2.has_o and board.c2.has_o then
    o_wins = true
  end
  if board.a3.has_o and board.b3.has_o and board.c3.has_o then
    o_wins = true
  end
  if board.a1.has_o and board.b2.has_o and board.c3.has_o then
    o_wins = true
  end
  if board.a3.has_o and board.b2.has_o and board.c1.has_o then
    o_wins = true
  end
end
local check_cell
check_cell = function(given_cell)
  local cell = get_cell_for(given_cell)
  if (moused_over(given_cell)) and (left_clicked()) then
    if not (cell.has_piece) then
      click:stop()
      click:play()
    end
    love.graphics.print("left-clicked on cell " .. given_cell, 100, 40)
    if (player_piece) == "x" and not cell.has_piece then
      cell.has_piece = true
      cell.has_o = false
      cell.has_x = true
    elseif (player_piece) == "o" and not cell.has_piece then
      cell.has_piece = true
      cell.has_x = false
      cell.has_o = true
    end
  end
  if (moused_over(given_cell)) and (right_clicked()) then
    if not (cell.has_piece) then
      click:stop()
      click:play()
    end
    love.graphics.print("right-clicked on cell " .. given_cell, 100, 40)
    if (player_piece) == "x" and not cell.has_piece then
      cell.has_piece = true
      cell.has_x = false
      cell.has_o = true
    elseif (player_piece) == "o" and not cell.has_piece then
      cell.has_piece = true
      cell.has_o = false
      cell.has_x = true
    end
  end
end
love.load = function()
  return music:play()
end
love.update = function(dt)
  mouse_x, mouse_y = love.mouse.getPosition()
  if (mute_music_btn:moused_over(mouse_x, mouse_y)) and left_clicked() then
    do
      mute_music_btn.pressed = false
      if mute_music_btn.pressed then
        mute_music_btn.pressed = true
      else
        mute_music_btn.pressed = false
      end
    end
  end
  if not (x_wins or o_wins) then
    check_cell("a1")
    check_cell("a2")
    check_cell("a3")
    check_cell("b1")
    check_cell("b2")
    check_cell("b3")
    check_cell("c1")
    check_cell("c2")
    check_cell("c3")
    check_for_winner()
  end
  if love.keyboard.isDown("space") then
    reset()
  end
  if (x_wins or o_wins) and not airhorn_played then
    airhorn:stop()
    airhorn:play()
    airhorn_played = true
  end
end
love.draw = function()
  love.graphics.setBackgroundColor(5, 5, 5)
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("line", 1, 1, 798, 598)
  love.graphics.print("window width:    " .. window_width, 10, 10)
  love.graphics.print("window height:  " .. window_height, 10, 25)
  love.graphics.print("cursor x: " .. mouse_x, 10, 50)
  love.graphics.print("cursor y: " .. mouse_y, 10, 65)
  mute_music_btn:draw()
  mute_sfx_btn:draw()
  if x_wins then
    love.graphics.setColor(100, 100, 255)
    love.graphics.print("Player 'X' wins!", 10, 550, 0, 3)
  elseif o_wins then
    love.graphics.setColor(255, 100, 0)
    love.graphics.print("Player 'O' wins!", 10, 550, 0, 3)
  else
    love.graphics.setColor(255, 255, 255)
  end
  if x_wins then
    love.graphics.setColor(255, 100, 0)
  elseif o_wins then
    love.graphics.setColor(100, 100, 255)
  else
    love.graphics.setColor(255, 255, 255)
  end
  board:render2()
  if board.a1.has_x then
    board:place("x", "a1")
  end
  if board.a2.has_x then
    board:place("x", "a2")
  end
  if board.a3.has_x then
    board:place("x", "a3")
  end
  if board.b1.has_x then
    board:place("x", "b1")
  end
  if board.b2.has_x then
    board:place("x", "b2")
  end
  if board.b3.has_x then
    board:place("x", "b3")
  end
  if board.c1.has_x then
    board:place("x", "c1")
  end
  if board.c2.has_x then
    board:place("x", "c2")
  end
  if board.c3.has_x then
    board:place("x", "c3")
  end
  if board.a1.has_o then
    board:place("o", "a1")
  end
  if board.a2.has_o then
    board:place("o", "a2")
  end
  if board.a3.has_o then
    board:place("o", "a3")
  end
  if board.b1.has_o then
    board:place("o", "b1")
  end
  if board.b2.has_o then
    board:place("o", "b2")
  end
  if board.b3.has_o then
    board:place("o", "b3")
  end
  if board.c1.has_o then
    board:place("o", "c1")
  end
  if board.c2.has_o then
    board:place("o", "c2")
  end
  if board.c3.has_o then
    return board:place("o", "c3")
  end
end
