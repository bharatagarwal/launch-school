require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative "todolist"

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal false, @list.done?
  end

  def test_type_error
    assert_raises(TypeError) { @list.add('test') }
  end

  def test_concat
    new_todo = Todo.new('Test this')
    @list << new_todo
    assert_includes(@list.to_a, new_todo)
  end

  def test_add
    new_todo = Todo.new('Test this')
    @list.add new_todo
    assert_includes(@list.to_a, new_todo)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
        assert_raises(IndexError) { @list.mark_done_at(@list.size) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)
    
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_all_done
    @todos.each { |todo| todo.done! }
    @list.done!
    assert_equal(@list.to_a, @todos)
  end

  def test_remove_at
    assert_equal(@list.remove_at(1),
                 @todos.delete(@todos[1]))

    assert_equal(@list.to_a, @todos)

    assert_raises(IndexError) do
      @list.remove_at(@list.size)
    end

    assert_raises(IndexError) do
      @list.remove_at((@list.size + 1) * -1)
    end
  end

  def test_to_s
    output = <<OUTPUT.chomp
---- Today's Todos ----
[ ] Buy milk
[ ] Clean room
[ ] Go to gym
OUTPUT

  assert_equal(output, @list.to_s)
  end

  def test_to_s_with_one_done
    @todo1.done!
    output = <<OUTPUT.chomp
---- Today's Todos ----
#{@todo1}
#{@todo2}
#{@todo3}
OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_all_done
    @list.done!
    output = <<OUTPUT.chomp
---- Today's Todos ----
#{@todo1}
#{@todo2}
#{@todo3}
OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each
    index = 0
    @list.each do |todo|
      assert_equal(todo.title, @todos[index].title)
      index += 1
    end
  end

  def test_each_return_value
    assert_equal(@list.each, @list)
  end

  def test_select
    selected1 = @todos.select { |td| td.done? }
    selected2 = @list.select { |td| td.done? }
    assert_equal(selected1, selected2.to_a)
  end
end
