require 'sinatra'
require 'sinatra/reloader'
require 'redcarpet'

configure do
  enable :sessions
end

def data_path
  if ENV["RACK_ENV"] == 'test'
    File.absolute_path("./test/data")
  else
    File.absolute_path("./data")
  end
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

before do
  @filenames = Dir.children(data_path)
end

get '/' do
  erb :files
end

get '/:filename' do
  if !@filenames.include?(params[:filename])
    session[:message] = "#{params[:filename]} does not exist."
    redirect '/'
  end

  file_contents = File.read("#{data_path}/#{params[:filename]}")

  extension = params[:filename].split('.')[1]

  if extension == 'md'
    return render_markdown(file_contents)
  else
    headers["Content-Type"] = "text/plain" 
    File.read("#{data_path}/#{params[:filename]}")
  end
end

get "/:filename/edit" do
  @filename = params[:filename]
  file_path = File.absolute_path("#{data_path}/#{@filename}")
  
  @content = File.read(file_path)
  erb :edit
end

post '/:filename' do
  file_path = File.absolute_path("#{data_path}/#{params[:filename]}")
  File.write(file_path, params[:content])
  session[:message] = "#{params[:filename]} has been updated."
  redirect '/'
end