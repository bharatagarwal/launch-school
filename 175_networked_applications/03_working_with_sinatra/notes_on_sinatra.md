### Sinatra
Sinatra is a `domain specific language` for building websites, services and web applications in Ruby. Emphasises a minimalistic approach to development, offering only what is essential to handle HTTP requests, and deliver responses to clients.

Sinatra is not a framework, you'll find no object-relational mapper tools, no prefab-config files, you won't even get a proect folder unless you create one yourself.

Sinatra doesn't force you to adhere to any model - it's a lightweight wrapper around Rack middleware., and encourages a close relationship between service endpoints and HTTP verbs, making it ideal for web services and APIs.

MVC? model-view-controller is a way of architecting applications that may web frameworks have adopted.
Although these frameworks may have routing rules that are similar in some ways to Sinatra's routes, they typically also enforce them strictly with requirements on folder names and project hierarchies.

note: continued support for sinatra is being provided by the team at heroku.

### approaches to sinatra
_classic_ & _modular_

cannot have multiple classic applications in one Ruby process v/s
adding some methods to `Object` class.

Default was `WEBRick`, `Mongrel` an improvement because it was faster and more stable.

`Thin` uses code from Mongrel to parse HTTP requests, 

Thin > Mongrel > WEBrick | Sinatra preferences.

Sinatra's base class defines a handful of public methods matching https verbs. The methods accept paths, options and blocks.

Routes in your aplication are matched in top-do wn order - the first route that matches the incoming request is the one that gets used.

The discussions on `request` and `response` take place from the perspective of the server

`request` will contain properties related to client speaking to server: location header, cookie data
`response` will contain information for client to parase:
content length, how long to cache
---

`GET` request is used to ask a server to return a representation of a resource.
`POST` is ised to submit data to a web server
`PUT` is used to create or update a representation of a resource on a server. eg adding photos to an online album

If `POST` request, current URL _may_ handle payload application
If `PUT` request, the supplied location must be what handles it.
`PUT` must refer to one - and only one - resource in particular.

`DELETE` is used to destroy a resource on a server.
Usually, it's implemented in the form of POST. The HTML `<form>` element supports only GET and POST as available actions.

`GET`, `PUT` and `POST` expected to demonstrate _idempotence_, ie should deliver identical resoults if the action is repeated.

`PATCH` is used to update a portion of a resource; as opposed to `PUT` that replaces it whole.

`OPTIONS`, `HEAD`, `TRACE`, `CONNECT` - not discussed.
---

In case of data submission requests, the data in payload is available in the `params` hash. Unlike `GET` and `DELETE` requests, you don't need to specify payload parameters in the URL.

the params indifferent hash is only available in the binding of the block attached to get, and not outside it.
