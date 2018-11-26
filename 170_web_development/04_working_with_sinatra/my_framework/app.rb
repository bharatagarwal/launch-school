require_relative 'monroe'
require_relative 'advice'

class App < Monroe
  def call env
    case env['REQUEST_PATH']
    when '/'
      status = 200
      header = {'Content-Type' => 'text/html'}
      response(status, header) do
        erb :index
      end
    when '/advice'
      status = 200
      header = {'Content-Type' => 'text/html'}
      response(status, header) do
        erb(:advice, message: Advice.new.generate)
      end
    else
      status = 400
      header = {'Content-Type' => 'text/html'}
      response(status, header) do 
        erb(:not_found)
      end
    end
  end
end
