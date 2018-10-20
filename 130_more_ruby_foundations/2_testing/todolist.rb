require 'pry'

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    self.done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError.new("Can only add Todo objects") if todo.class != Todo
    @todos << todo
  end

  alias :<< :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index = nil)
    @todos.fetch(index)
  end

  def mark_done_at(index=nil)
    item_at(index).done!
  end

  def mark_undone_at(index=nil)
    item_at(index).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index=nil)
    @todos.delete(item_at(index))
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  def to_s
    output = "---- #{@title} ----\n"
    @todos.each do |todo|
      output <<  "#{todo}\n"
    end

    output.chomp
  end

  def to_a
    @todos
  end


  def each
    if block_given?
      @todos.each { |todo| yield(todo) }
    end

    self
  end

  def select
    results = TodoList.new(title)

    @todos.each do |todo|
      results << todo if yield(todo)
    end

    results
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def mark_done(title)
    if find_by_title(title)
      find_by_title(title).done!
    else
      puts "Title doesn't exist."
    end
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| todo.done? }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end
