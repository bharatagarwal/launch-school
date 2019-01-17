require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

root = __FILE__.delete_suffix(File.basename(__FILE__))

get '/' do
  @files = Dir.glob("#{root}/data/*")
              .map { |path| File.basename(path) }
              .sort

  erb :index
end