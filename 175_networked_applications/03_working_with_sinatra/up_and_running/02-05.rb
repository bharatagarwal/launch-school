require 'sinatra'

get '/:name' do
  "You asked for #{params[:name]} as well as #{params[:foo]}"
end
