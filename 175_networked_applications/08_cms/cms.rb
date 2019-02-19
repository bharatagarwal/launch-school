require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  # binding.pry
  @filenames = Dir.children('data')

  erb :files
end

get '/:filename' do
  headers["Content-Type"] = "text/plain"
   
  File.read("./data/#{params[:filename]}")
end