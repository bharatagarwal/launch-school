require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  # binding.pry
  filenames = Dir.children('data')
  @filepaths = filenames.map { |f| File.absolute_path("data/#{f}")}
  @filepaths.to_s

  erb :files
end