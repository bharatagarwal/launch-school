require 'sinatra'
require 'sinatra/reloader'
require 'redcarpet'
require 'yaml'
require 'bcrypt'
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

def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
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
  p @filenames
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
  # not necessary here as validation is happening beforehand.

  extension = params[:filename].split('.')[1]

  if extension == 'txt'
    headers["Content-Type"] = "text/plain" 
    File.read("#{data_path}/#{params[:filename]}")
  elsif extension == 'md'
    erb render_markdown(file_contents)
  end
end

get "/:filename/edit" do
  require_signed_in_user

  # basename used to make sure files are not accidentally made to root directory.

  # you don't want - reading a ../* file, which could happen via query params
  #                - writing a ../* file, which could happen via form
  #                - editing a ../* file, which could happen via url accessing using query params.
  #                - deleting a ../*file, which could happen via url acces via query params.
  # essentially all CRUD actions.
  

  @filename = params[:filename]
  file_path = File.absolute_path("#{data_path}/#{File.basename(@filename)}")
  
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
    file_path = File.absolute_path("#{data_path}/#{File.basename(filename)}")
    File.write(file_path, params[:content])
    session[:message] = "#{filename} has been created."
    redirect '/'
  end
end

post '/:filename' do
  require_signed_in_user

  file_path = File.absolute_path("#{data_path}/#{File.basename(params[:filename])}")
  File.write(file_path, params[:content])
  session[:message] = "#{params[:filename]} has been updated."
  redirect '/'
end

post '/:filename/delete' do
  require_signed_in_user

  file_path = File.absolute_path("#{data_path}/#{File.basename(params[:filename])}")
  File.delete(file_path)

  session[:message] = "#{params[:filename]} has been deleted."
  redirect "/"    
end

post '/users/signin' do
  credentials = load_user_credentials
  username = params[:username]
  
  if valid_credentials?(username, params[:password]) 
    session[:username] = username
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