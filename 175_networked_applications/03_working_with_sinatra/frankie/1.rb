module Frankie
  class Application
    def self.routes
      @routes ||= []
    end

    def self.get(path, &block)
      route('GET', path, block)
    end

    def self.post(path, &block)
      route('POST', path, block)
    end

    def self.route(verb, path, block)
      routes << {
        verb: verb,
        path: path,
        block: block
      }
    end

    def self.call(env)
      new.call(env)
    end

    def call(env)
      @request = Rack::Request.new(env)
      @verb = @request.request_method
      @path = @request.path_info

      @response = {
        status: 200,
        headers: headers,
        body: []
      }

      route!

      @response.values
    end

    def status(code)
      @response[:status] = code
    end

    def headers
      @headers ||= { "Content-Type" => "text.html" }
    end

    def body(string)
      @response[:body] = string
    end

    def route!
      match = Application.routes
                         .select { |route| route[:verb] == @verb }
                         .find { |route| route[:path] == @path }
      return 404 if !match

      body match[:block].call
    end
  end
end

Frankie::Application.get('/') { "Frankie says hello." }
puts Frankie::Application.routes
