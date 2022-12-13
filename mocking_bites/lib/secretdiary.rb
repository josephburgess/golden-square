class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    @contents = diary.read
    @locked = true
  end

  def read
    raise 'Go away!' if @locked

    @contents
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end
