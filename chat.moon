socket = require "socket"

server = assert(socket.bind "*", 9999)

ip, port = server\getsockname!