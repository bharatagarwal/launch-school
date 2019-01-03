require 'sinatra'
require 'sinatra/reloader'
require 'erb'

get '/' do
  @files = Dir.glob('public/*').map { |f| File.basename(f) }.sort
  @files.reverse! if params[:sort] == 'desc'
  erb :layout
end