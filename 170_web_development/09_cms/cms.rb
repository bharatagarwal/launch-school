require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

root = __FILE__.delete_suffix(File.basename(__FILE__))

get '/test' do
  Math.sqrt(55).to_s
end

get '/' do
  @files = Dir.glob("#{root}/data/*")
              .map { |path| File.basename(path) }
              .sort

  erb :index
end

get '/:filename' do
  file_path = root + "data/" + params[:filename]
  
  headers["Content-Type"] = "text/plain"
  File.read(file_path)
end