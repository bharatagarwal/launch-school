module Sinatra
  class Base
    def self.get
      'hello'     # => 
    end           # => :get
  end             # => :get

  # Base.get  # => "hello"

  class Application < Base  # => Sinatra::Base
  end                       # => nil
end
# Application.get  # => "hello"

Sinatra::Application.get  # => Sinatra::Application