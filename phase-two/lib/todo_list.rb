class TodoList
  def initialize
    @list = []
  end

  def add(todo)
    @list << todo
  end

  def incomplete
    incomplete_array = []
    @list.each { |todo| incomplete_array << todo.task if todo.done? == false }
    incomplete_array
  end

  def complete
    complete_array = []
    @list.each { |todo| complete_array << todo.task if todo.done? == true }
    complete_array
  end

  def give_up!
    @list.each { |todo| todo.mark_done! }
  end
end
