TCPSocket.

socket - a natural or artificial hollow into which something fits or in which something revolves.

`Sockets are endpoints of a bidirectional communication channel. Sockets can communicate within a process, between processes on the same machine or between different machines. There are many types of socket: TCPSocket, UDPSocket or UNIXSocket for example.`
- from ruby documentation

tcp is one of the many protocols in the `tcp/ip` stack, otherwise known as the internet protocol suite.

internet protocol covers:
--- 
application
presentation
session
transport       (tcp)
---
network
data link
physical link
...

socket = ip address + port

the location within the device itself through which the destination application is receiving data must be also specified - this location is referred to as a __port__.

one ip address - can receive information through different ports.

the sending application doesn’t know which port the  receiving application is listening to. we use default ports, which are default by convention.

standard port numbers set by internet assigned numbers authority (iana) has dedicated to applications or services as conventions. 
port 80 ->  HTTP services,
port 80 ->  FTP also possible, but not used traditionally.

