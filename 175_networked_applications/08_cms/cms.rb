require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  # binding.pry
  @filenames = Dir.children('data')

  erb :files
end

get '/:filename' do
  [200, 
  {"Content-Type" => "text/plain"}, 
  File.readlines("./data/#{params[:filename]}")]
end