class TodoList
  def initialize(name) # name is a string
    @name = name
  end

  def remind_me_to(task) # task is a string
    @task = task
    # No return value
  end

  def remind
    # Throws an exception if no task is set
    # Otherwise, returns a string reminding the user to do the task
  end
end
