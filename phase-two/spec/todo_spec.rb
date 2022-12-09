require 'todo.rb'

describe 'todo unit tests' do
  task_1 = 'Walk the dog'

  it 'initializes and accepts a task' do
    todo_1 = Todo.new(task_1)
  end
  it 'can return walk the dog as a string' do
    todo_1 = Todo.new(task_1)
    expect(todo_1.task).to eq 'Walk the dog'
  end
  it 'will return false when done? is called and the task is not yet done' do
    todo_1 = Todo.new(task_1)
    expect(todo_1.done?).to eq false
  end
  it 'will return true when calling done? on a completed task' do
    todo_1 = Todo.new(task_1)
    todo_1.mark_done!
    expect(todo_1.done?).to eq true
  end
end