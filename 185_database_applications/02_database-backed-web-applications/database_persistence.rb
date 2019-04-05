require 'pg'
require 'pry'

class DatabasePersistence
  def initialize(logger)
    @db = PG.connect(dbname: "todos")
    @logger = logger
  end

  def query(statement, *params)
    @logger.info "#{statement.chomp}: #{params}"
    @db.exec_params(statement, params)
  end

  def array_of_todos_for(todos, id)
    # {"id"=>"1", "name"=>"Science", "completed"=>"f", "list_id"=>"1"}
    todos.select do |todo|
      todo['list_id'].to_i == id
    end.map do |hash|
      # binding.pry
      { id: hash['id'], name: hash['name'], completed: hash['completed'] == 't'}
    end
  end

  def find_list(id)
    statement = <<~HEREDOC
      select * from lists
      where id = $1
    HEREDOC

    todos_statement = <<~HEREDOC
      select * from todos
      where list_id = $1
    HEREDOC

    result = query(statement, id)
    todos = query(todos_statement, id)

    # binding.pry

    tuple = result.first
    { id: tuple['id'], name: tuple['name'], todos: array_of_todos_for(todos, id) }
  end

  def all_lists
    statement = <<~HEREDOC
      select * from lists
    HEREDOC

    todos_statement = <<~HEREDOC
      select * from todos
    HEREDOC

    result = query(statement)
    todos = query(todos_statement)

    result.map do |tuple|
      { id: tuple['id'], name: tuple['name'], todos: array_of_todos_for(todos, tuple['id'].to_i) }
    end
  end

  def create_new_list(list_name)
    # @session[:lists] << { id: id, name: list_name, todos: []}
  end

  def delete_list(id)
    # @session[:lists].reject! { |list| list[:id] == id }
  end

  def update_list_name(id, new_name)
    # list = find_list(id)
    # list[:name] = new_name
  end

  def create_new_todo(list_id, todo_name)
    # list = find_list(list_id)
    # id = next_element_id(list[:todos])
    # list[:todos] << { id: id, name: todo_name, completed: false }
  end

  def delete_todo_from_list(list_id, todo_id)
    # list = find_list(list_id)
    # list[:todos].reject! { |todo| todo[:id] == todo_id }
  end

  def update_todo_status(list_id, todo_id, new_status)
    # list = find_list(list_id)
    # todo = list[:todos].find { |t| t[:id] == todo_id }
    # todo[:completed] = new_status
  end

  def mark_all_todos_as_completed(list_id)
    # list = find_list(list_id)
    # list[:todos].each do |todo|
      # todo[:completed] = true
    # end
  end
end