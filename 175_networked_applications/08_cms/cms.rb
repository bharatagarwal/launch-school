require 'sinatra'
require 'sinatra/reloader'
require 'pry'

configure do
  enable :sessions
end

before do
  @filenames = Dir.children('data')
end

get '/' do
  erb :files
end

get '/:filename' do
  if !@filenames.include?(params[:filename])
    session[:error] = "#{params[:filename]} does not exist."
    redirect '/'
  end
  
  headers["Content-Type"] = "text/plain"
   
  File.read("./data/#{params[:filename]}")
end