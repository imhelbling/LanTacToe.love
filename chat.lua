local socket = require("socket")
local server = assert(socket.bind("*", 9999))
local ip, port = server:getsockname()
