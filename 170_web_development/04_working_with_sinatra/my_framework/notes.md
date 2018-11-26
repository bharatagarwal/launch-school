### rack

over the four part blog, we will cover what rack is, how to use it to handle incoming requests, how to use templating techniques to return a response, and finally, how to extract common code to plant the seeds for your very own web application framework.

what is rack?

rack is a web server interface that providies a fluid api for creating web applications.

rack aims to provide a minimal api for connecting web servers supporting ruby (like webrick) and ruby web frameworks (like rails, sinatra, etc)

web frameworks like sinatra are built on top of rack, or have a rack interface for allowing web application servers to connect to them.

the premise of rack is simple - it allows you to easily deal with http requests.

a http request is a triplet, consisting of a method and resource pair, a set of headers, and an optional body.

eg. GET / ?param=value

a http response is a triplet, consisting of a set of headers and an optional body.

eg [200, {Content-Type => text/plain},  ["Hello World"]]

A rack application is a ruby application that has a call method, which takes a single argument, the environment (corresponding to an HTTP request) and returns an array of three elements: status, headers and body. (corresponding to a HTTP response)

Rack includes handlers that connect Rack to various application servers

Rack includes adapters that connect Rack to various frameworks

Between the server and the framework, Rack can be customised to your applications needs using middleware. The fundamental idea behind Rack middleware is -  come between the calling client and the server, process the HTTP request before sending it to the server, and processing the HTTP response before returning it to the client.
