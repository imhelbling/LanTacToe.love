local socket = require("socket")
local server = assert((socket.bind("*", 0)))
local ip, port = server:getsockname()
print("please telnet to localhost on port " .. tostring(port))
while 1 do
  local client = server:accept()
  client:settimeout(10)
  local line, err = client:recieve()
  if not (err) then
    client:send((line .. "\n"))
  end
  client:close()
end
