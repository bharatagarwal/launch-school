require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
end

before do
  session[:lists] ||= []
end

helpers do
  def load_list(index)
    list = session[:lists][index] if index && session[:lists][index]
    return list if list

    session[:error] = "The specified list was not found."
    redirect "/lists"
  end

  def list_complete?(list)
    todos_count(list) > 0 && todos_remaining_count(list) == 0  
  end

  def list_class(list)
    "complete" if list_complete?(list)
  end

  def todos_count(list)
    list[:todos].size    
  end
  
  def todos_remaining_count(list)
    list[:todos].count { |todo| todo[:completed] == false }
  end

  # algorithm with partition
  def sort_lists(lists)
    complete_lists, incomplete_lists = 
      lists.partition { |list| list_complete?(list) }

    incomplete_lists.each do |list|
      yield(list, lists.index(list))
    end

    complete_lists.each do |list|
      yield(list, lists.index(list))
    end
  end  

# algorithm with iteration; left here in this way for demonstration.
# better practice might be to make it more consistent.
# this is more of an academic choice.
  def sort_todos(todos)
    incomplete_todos = {}
    complete_todos = {}

    todos.each_with_index do |todo, index|
      if todo[:completed]
        complete_todos[index] = todo
      else
        incomplete_todos[index] = todo
      end
    end

    incomplete_todos.each do |index, todo|
      yield(todo, index)
    end
  
    complete_todos.each do |index, todo|
      yield(todo, index)
    end
  end
end

get '/' do
  redirect '/lists'
end

# View all the lists
get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Return an error message if list name is invalid.
# Return nil if name is valid.
def error_for_list_name(name)
  if !(1..100).cover?(name.size)
    "The list name must be between 1 and 100 characters."
  elsif session[:lists].any? { |list| list[:name] == name }
    "List name must be unique."
  end
end

def error_for_todo(name)
  if !(1..100).cover?(name.size)
    "Todo name must be between 1 and 100 characters."
  end
end

# Create a new list
post "/lists" do
  list_name = params[:list_name].strip
  
  error = error_for_list_name(list_name) 
  
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: params[:list_name], todos: [] }
    session[:success] = "The list has been created."
    redirect '/lists'
  end
end

get '/lists/:id' do
  @list_id = params[:id].to_i
  p session[:lists].class
  @list = load_list(@list_id)
  erb :list, layout: :layout
end

# Edit an existing todo list
get "/lists/:id/edit" do
  id = params[:id].to_i
  @list = load_list(id)

  erb :edit_list, layout: :layout
end

# Update an existing todo list
post "/lists/:id" do
  list_name = params[:list_name].strip

  id = params[:id].to_i
  @list = load_list(id)
    
  error = error_for_list_name(list_name) 
    
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = params[:list_name]
    session[:success] = "The list has been updated."
    redirect "/lists/#{params[:id]}"
  end  
end

# Delete a todo list
post "/lists/:id/destroy" do
  id = params[:id].to_i
  session[:lists].delete_at(id)
  if env["HTTP_X_REQUESTED_WITH"] = "XMLHttpRequest"
    "/lists"
  else
    session[:success] = "The list has been deleted."
    redirect "/lists"
  end
end

def next_todo_id(todos)
  max = todos.map { |todo| todo[:id] }.max || 0
  max + 1
end

# Add a new todo to a list
post "/lists/:list_id/todos" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  text = params[:todo].strip

  error = error_for_todo(text)

  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    id = next_todo_id(@list[:todos])
    @list[:todos] << { id: id, name: text, completed: false }
    session[:success] = "The todo was added."
    redirect "/lists/#{@list_id}"
  end
end

# Delete a todo from a list
post "/lists/:list_id/todos/:id/destroy" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  todo_id = params[:id].to_i
  @list[:todos].reject! { |todo| todo[:id] == todo_id }

  p env.class
  if env["HTTP_X_REQUESTED_WITH"] = "XMLHttpRequest"
    # ajax
    status 204
  else
    session[:success] = "The todo has been deleted."
    redirect "/lists/#{@list_id}"
  end
end

# Update the status of a todo
post "/lists/:list_id/todos/:id" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  todo_id = params[:id].to_i

  is_completed = params[:completed] == "true"
  todo = @list[:todos].find { |todo| todo[:id] == todo_id }
  todo[:completed] = is_completed
  
  session[:success] = "The todo has been updated."
  redirect "/lists/#{@list_id}"
end

# Mark all todos as complete for a list
post "/lists/:id/complete_all" do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)

  @list[:todos].each do |todo|
    todo[:completed] = true
  end

  session[:success] = "All todos have been completed."
  redirect "/lists/#{@list_id}"
end

