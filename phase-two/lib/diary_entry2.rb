class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @start_point = 0
  end

  attr_reader :title, :contents

  def count_words
    @contents.split(' ').count
  end

  def reading_time(wpm)
    @contents.split(' ').length / wpm
  end

  def reading_chunk(wpm, minutes)
    end_point = @start_point + wpm * minutes
    string = @contents.split[@start_point...end_point].join(' ')
    @start_point = @start_point >= @contents.split.size ? 0 : end_point
    string
  end
end
