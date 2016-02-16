socket = require "socket"

server = assert(socket.bind "*", 9999)

ip, port = server\getsockname!



print "please telnet to localhost on port #{port}"

while true
	client = server\accept!
	client\settimeout 10



	line = ""

	while line != "exit"

		print "listening loop"

		line, err = client\receive!

		unless err
			client\send (">>"..string.upper (line.."\n"))
			print "received line: '#{line}'"

	client\close!