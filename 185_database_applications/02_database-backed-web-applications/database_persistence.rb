require 'pg'

class DatabasePersistence
  def initialize(logger)
    @db = PG.connect(dbname: "todos")
    @logger = logger
  end

  def query(statement, *params)
    @logger.info "#{statement}: #{params}"
    @db.exec_params(statement, params)
  end

  def find_list(id)
    sql = "select * from lists where id = $1"
    result = query(sql, id)
    
    tuple = result.first
    
    list_id = tuple['id'].to_i
    todos = find_todos_for_list(list_id)
    { id: list_id, name: tuple['name'], todos: todos }
  end

  def all_lists
    sql = "select * from lists"
    result = query(sql)

    result.map do |tuple|
      list_id = tuple['id'].to_i
      todos = find_todos_for_list(list_id)

      { id: list_id, name: tuple['name'], todos: todos }
    end
  end

  def create_new_list(list_name)
    sql = "insert into lists (name) values ($1)"
    query(sql, list_name)
    # @session[:lists] << { id: id, name: list_name, todos: []}
  end

  def delete_list(id)
    sql = "delete from lists where id = $1"
    query(sql, id)
    # @session[:lists].reject! { |list| list[:id] == id }
  end

  def update_list_name(id, new_name)
    sql = "update lists set name = $1 where id = $2"
    query(sql, new_name, id)
    # list = find_list(id)
    # list[:name] = new_name
  end

  def create_new_todo(list_id, todo_name)
    sql = "insert into todos (name, list_id) values ($1, $2)"
    query(sql, todo_name, list_id)
  end

  def delete_todo_from_list(list_id, todo_id)
    sql = "delete from todos where list_id = $1 and id = $2"
    query(sql, list_id, todo_id)
  end

  def update_todo_status(list_id, todo_id, new_status)
    status = new_status == true ? 't' : 'f'
    
    sql = "update todos set completed = $1 where id = $2 and list_id = $3"
    query(sql, status, todo_id, list_id)
  end

  def mark_all_todos_as_completed(list_id)
    status = 't'
    sql = "update todos set completed = $1 where list_id = $2"
    query(sql, status, list_id)
  end

  private

  def find_todos_for_list(list_id)
    todos_sql = "select * from todos where list_id = $1"
    todos_result = query(todos_sql, list_id)

    todos = todos_result.map do |todo_tuple|
      { id: todo_tuple['id'].to_i,
        name: todo_tuple['name'],
        completed: todo_tuple['completed'] == 't'
      }
    end
  end
end