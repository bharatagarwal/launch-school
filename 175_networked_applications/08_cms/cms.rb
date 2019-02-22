require 'sinatra'
require 'sinatra/reloader'
require 'redcarpet'
require 'yaml'
require 'pry'

configure do
  enable :sessions
end

def load_user_credentials
  user_credentials = 
    if ENV["RACK_ENV"] == "test"
      File.absolute_path('./test/users.yml')
    else 
      File.absolute_path('./users.yml')
    end

  YAML.load_file(user_credentials)
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

def user_signed_in?
  session.key?(:username)
end

def require_signed_in_user
  unless  user_signed_in?
    session[:message] = "You must be signed in to do that."
    redirect '/'
  end
end

before do
  @filenames = Dir.children(data_path)
end

get '/' do
  # binding.pry
  erb :files
end

get '/users/signin' do
  erb :login
end


get '/new' do
  require_signed_in_user

  erb :new
end

get '/:filename' do
  if !@filenames.include?(params[:filename])
    session[:message] = "#{params[:filename]} does not exist."
    redirect '/'
  end

  file_contents = File.read("#{data_path}/#{params[:filename]}")

  extension = params[:filename].split('.')[1]

  if extension == 'md'
    erb render_markdown(file_contents)
  else
    headers["Content-Type"] = "text/plain" 
    File.read("#{data_path}/#{params[:filename]}")
  end
end

get "/:filename/edit" do
  require_signed_in_user

  @filename = params[:filename]
  file_path = File.absolute_path("#{data_path}/#{@filename}")
  
  @content = File.read(file_path)
  erb :edit
end

post '/create' do
  require_signed_in_user

  filename = params[:filename]
  if filename.empty?
    session[:message] = "A name is required."
    status 422
    # 422 - unprocessable entity
    erb :new
  elsif filename.split('.').size == 1
    session[:message] = "Please provide an extension to the filename."
    status 422
    erb :new
  else    
    file_path = File.absolute_path("#{data_path}/#{filename}")
    File.write(file_path, params[:content])
    session[:message] = "#{filename} has been created."
    redirect '/'
  end
end

post '/:filename' do
  require_signed_in_user

  file_path = File.absolute_path("#{data_path}/#{params[:filename]}")
  File.write(file_path, params[:content])
  session[:message] = "#{params[:filename]} has been updated."
  redirect '/'
end

post '/:filename/delete' do
  require_signed_in_user

  file_path = File.absolute_path("#{data_path}/#{params[:filename]}")
  File.delete(file_path)

  session[:message] = "#{params[:filename]} has been deleted."
  redirect "/"    
end

post '/users/signin' do
  credentials = load_user_credentials
  username = params[:username]
  
  if credentials.has_key?(username) && 
    credentials[username] == params[:password]

    session[:username] = params[:username]
    session[:message] = 'Welcome!'
    redirect '/'
  else
    session[:message] = 'Invalid credentials'
    status 422
    erb :login
  end
end

post '/users/signout' do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect '/'
end