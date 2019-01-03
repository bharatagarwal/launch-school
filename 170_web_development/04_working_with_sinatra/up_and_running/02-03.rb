require 'sinatra'

get '/:name' do
  "#{params.class}!"
end
