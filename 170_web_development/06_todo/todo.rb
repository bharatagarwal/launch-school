require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  session[:lists] ||= []
end

get '/lists' do
  @lists = session[:lists]
#    { name: "Lunch Groceries",
#      todos: [] },
#    { name: "Dinner Groceries",
#      todos: [] }
#  ]
  erb :lists, layout: :layout
end

get '/' do
  redirect '/lists'
end

get '/lists/new' do
  
  erb :new_list, layout: :layout
end