require 'todo_list'
require 'todo'

describe 'TodoList & Todo integration' do
  task_1 = 'Walk the dog'
  task_2 = 'Mow the lawn'
  task_3 = 'Clean the car'

  it 'returns completed task when one has been provided and marked done' do
    todolist = TodoList.new
    todo_1 = Todo.new(task_1)
    todolist.add(todo_1)
    todo_1.mark_done!
    expect(todolist.complete).to eq [todo_1.task]
  end
  it 'returns only incomplete tasks when calling incomplete method' do
    todolist = TodoList.new
    todo_1 = Todo.new(task_1)
    todo_2 = Todo.new(task_2)
    todolist.add(todo_1)
    todolist.add(todo_2)
    todo_1.mark_done!
    expect(todolist.incomplete).to eq [todo_2.task]
  end
  it 'returns a list of complete tasks when there are more than one completed' do
    todolist = TodoList.new
    todo_1 = Todo.new(task_1)
    todo_2 = Todo.new(task_2)
    todolist.add(todo_1)
    todolist.add(todo_2)
    todo_1.mark_done!
    todo_2.mark_done!
    expect(todolist.complete).to eq [todo_1.task, todo_2.task]
  end
  it 'marks all tasks complete when giving up' do
    todolist = TodoList.new
    todo_1 = Todo.new(task_1)
    todo_2 = Todo.new(task_2)
    todo_3 = Todo.new(task_3)
    todolist.add(todo_1)
    todolist.add(todo_2)
    todolist.add(todo_3)
    todolist.give_up!
    list_variable = todolist.instance_variable_get(:@list)
    expect(todolist.instance_variable_get(:@list)[0].done?).to eq true
    expect(todolist.instance_variable_get(:@list)[1].done?).to eq true
    expect(todolist.instance_variable_get(:@list)[2].done?).to eq true
  end
end
