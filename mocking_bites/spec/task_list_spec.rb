require 'task_list'

RSpec.describe TaskList do
  before :each do
    @tasklist = TaskList.new
  end

  it 'initially has an empty list' do
    expect(@tasklist.all).to eq []
  end

  it 'is initially not all complete' do
    expect(@tasklist.all_complete?).to eq false
  end

  it 'returns a list of all tasks' do
    task1 = double :task
    task2 = double :task
    @tasklist.add(task1)
    @tasklist.add(task2)
    expect(@tasklist.all).to eq [task1, task2]
  end

  it 'returns false if not all tasks have been completed' do
    task1 = double :task, complete?: true
    task2 = double :task, complete?: false
    @tasklist.add(task1)
    @tasklist.add(task2)
    expect(@tasklist.all_complete?).to eq false
  end

  it 'returns false if not all tasks have been completed' do
    task1 = double :task, complete?: true
    task2 = double :task, complete?: true
    @tasklist.add(task1)
    @tasklist.add(task2)
    expect(@tasklist.all_complete?).to eq true
  end
end
