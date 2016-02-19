local socket = require("socket")
local server = assert(socket.bind("*", 9999))
local ip, port = server:getsockname()
print("please telnet to localhost on port " .. tostring(port))
while true do
  local client = server:accept()
  client:settimeout(10)
  local line = ""
  while line ~= "exit" do
    print("listening loop")
    local err
    line, err = client:receive()
    if not (err) then
      client:send((">>" .. string.upper((line .. "\n"))))
      print("received line: '" .. tostring(line) .. "'")
    end
  end
  client:close()
end
