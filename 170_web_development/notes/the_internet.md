## chapter 9 - the internet

the internet is neither a giant computer nor a giant network. It's a loose, unstructured, chaotic, ad-hoc collection of networks, bound together by standards that define how networks and computers on them communicate with each other.

network protocols are based on technical considerations, not social custom, and are much more precise than even the most rigid social structure.

from the beginning the arpanet was designed to be robust in the face of failure of any of its components and to route traffic around problems.

networks are connected to other networks via gateways or routers.

a packet is a sequence of bytes with a specified format. part of the packet will contain address information that tell to and fro, some meta information like packet length, and the biggest part, the payload.

largest possible ethernet packet: 1_500 bytes
largest possible IP       packet: 65_000 bytes

IP packets have the same format. On a network, IP packets may be transported in one or more physical packets. A large IP packet will be split into multiple smaller Ethernet packets.

Each packet passes through multiple gateways; each gateway passes the packet on to a gateway that is closer to the packet's ultimate destination.

### addresses:
IPv4

decimal:    128           112          132            86
binary: 10_00_00_00   01_11_00_00   10_00_01_00   01_01_01_10
hex:        80             70           84            56
            8 bits       8 bits      8 bits         8 bits  = 32 bits
            1 byte       1 byte      1 byte         1 byte  = 4 bytes

### protocols:
the internet protocol defines a uniform transport mechanism and a common format for information in transit. ip packets are carried by different kinds of network hardware using their own protocols.

above ip, the protocol called tranmission control protocol uses ip to provide a reliable mechanism for sending arbitrarily long sequences of bytes from source to destination.

above tcp, higher level protocols use tcp to provide the services we think of as 'the internet', like browsing, mail, file sharing, and so on.

dynamic host configuration protocol (dhcp) handles changing ip addresses dynamically.

### organisations
ietf  - internet engineering task force
icann - internet corporation for assigned names and numbers; 
  began as an agency of the is department of commerce

### names
princeton.edu           top-level domain
cs.princeton.edu        sub-domain names
www.cs.princeton.edu    further down the hierarchy

### ip addresses

princeton has 128.112.ddd.ddd and 140.180.ddd.ddd allocated, and therefore has `(256 * 256) * 2 = 131072` potential blocks.

IPv4 addresses are 32 bit numbers, usually represented in the form of dotted decimals.

techniques for piggybacking multiple hosts onto a single ip address provides a bit of breathing room on the potential ip address to be used. home wireless routers provide a _network address translation_ (nat) service, where a single external ip address can serve multiple internal ip addresses.

if you have a nat, all of your home devices appear externally to have the same ip addresses, hardware and software in the device handle the conversion in both directions.

### root servers

mit.edu         -> root server
cs.mit.edu      -> mit name server
www.cs.mit.edu  -> name server from mit server


an initial query at the top immediately eliminates most potential addresses from further consideration.

there are 13 root servers, spread over the world. about a half of them are in the usa.

some of these servers consist of multiple computers at widely separated locations that function like a single computer but use a protocol that routes requests to the nearest member of the group.

```
$ nslookup bharatagarwal.in
Server:     1.1.1.1
Address:    1.1.1.1#53

Non-authoritative answer:
Name:   bharatagarwal.in
Address: 159.65.206.192
```

### registering your domain

icann has accredited hundreds of registrars, so you can pick one, choose your domain name, pay for it, and it's yours.

names are limited to 30 characters.
until recently, could only contain letters, numbers and hyphens.

you need a `host` for your site: a computer to hold and serve the content that your site will display to visitors.
you need a `nameserver` to respond to the ip address of your host.

### routing

routing: finding a path from source to destination.

internet gateways continusly refresh routing information by exchanging information with adjacent gateways.

at the top level: tens of thousands of autonomous systems provide routing information about the networks they contain. usually an autonomous system corresponds to a large isp.

for high volume between major carriers, there are 'peering points', where the network connections from several companies meet and physical connections are made between networks, so data from one network can be efficiently passed to another.

```
$ traceroute bharatagarwal.in
traceroute to bharatagarwal.in (159.65.206.192), 64 hops max, 52 byte packets
 1  192.168.1.1 (192.168.1.1)  6.967 ms  4.441 ms  4.137 ms
 2  abts-north-static-236.220.160.122.airtelbroadband.in (122.160.220.236)  7.775 ms  8.232 ms  8.629 ms
 3  125.18.72.113 (125.18.72.113)  8.947 ms
    125.19.176.173 (125.19.176.173)  8.228 ms
    125.17.177.113 (125.17.177.113)  7.652 ms
 4  182.79.153.90 (182.79.153.90)  7.860 ms
    182.79.245.229 (182.79.245.229)  126.847 ms
    182.79.153.81 (182.79.153.81)  7.711 ms
 5  182.79.190.67 (182.79.190.67)  129.913 ms
    182.79.179.93 (182.79.179.93)  37.362 ms  38.224 ms
 6  138.197.250.87 (138.197.250.87)  151.178 ms
    182.79.177.143 (182.79.177.143)  35.975 ms
    182.79.177.97 (182.79.177.97)  51.916 ms
 7  159.65.206.192 (159.65.206.192)  148.828 ms
    182.79.245.134 (182.79.245.134)  134.866 ms
    159.65.206.192 (159.65.206.192)  146.970 ms
```

### protocols

the internet protocol defines how individual packets are formatted and trasmitted

the transmission control protocol defines how ip packets can be combined into streams of data and connected into services.

together, they are called tcp/ip.

gateways route ip packets, though each physical network has its own format for carrying ip packets, and the gateway has to convert between the network format and IP as packets come and go.

tcp provides reliable communication, so that programmers don't have to think about packets, just streams of information.

most of the servies we think of as 'the internet' use tcp.

application-level protocols are built on top of tcp - web, mail, file transfer, and so on.

applications
tcp | udp
ip
physical layer

udp - user datagram protocol, much simpler than tcp
used for data exchange that doesn't require two-way streams, just efficient packet delivery with some extra features.
uses - DNS, video streaming, VoIP, some online games.

### the internet protocol

"unreliable connectionless" packet delivery service

each ip packet is self-contained, and has no relationship to any other ip packet. ip has no state or memory.

ip is a `best effort` protocol that makes no guarantees about how well it delivers packets. when a packet goes astray, there's no attempt at recovery.

IPv4 packet format
---

version
type
hdr len
total len
--
ttl 
`time to live`: a one byte field that is set to an initial value by the source of the packet, and decreased by one by each hateway that handles the packet. 

if count reaches zero, the packet is discarded and an error packet is sent back.

a typical trip through the internet might involve 15-20 gateways.
--
source address
destination address
error check
data (upto 65k)

### tranmission control protocol

a stream of bytes is chopped up into pieces and put into TCP packets or segments. A TCP segment contains not only the real data, but also a header with control information, including a sequence number. a lost segment is detected this way, and can be resent.

error detection information is included, so if a segment is damaged, that is likely to be detected.

each tcp segment is transmitted in an ip packet.

tcp segment header contains:
---

source port
destination port
sequence number
acknowledgement
error check
other info
--

each segment must be acknowledged by the recepient - positively or negatively.

if an operation is taking too long, recovery can be attempted. ultimately, a connection will 'time out' and be abondoned.

each port represents a separate conversation. a port is represented by a 16 bit number, therefore there are 65,536 possible ports, and thus a host could be carrying on 65,536 sepratate TCP conversations at the same time.

web servers:  80
mail servers: 25
ssh:          22

tcp/ip built by vint cerf and bob kahn.

### higher level protocols

internet services and applications use tcp as their transport mechanism, but have their own protocols specific to the task at hand.

http is a particularly simple protocol used by web browsers and servers.

(client)                          (server)
app                                 app
|                                   |
tcp                                 tcp
|
ip       (gateway)                  |
|          ip                       ip
physical  / \ physical ... physical /
(phone)       (fibre)     (ethernet)

### smtp: simple mail transfer protocol
mime: multipurpose internet mail extensions describes how to combine multiple pieces into a single mail message. this is the mechanism used to include mail attachments like pictures and music, and is also used by http.

pop:  post office protocol
imap: internet message access protocol

it's common for mail to be handled 'in the cloud' by systems like Gmail and Yahoo. Underneath these use SMTP for transfer and behave like IMAP for client access.
