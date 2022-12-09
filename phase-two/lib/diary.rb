class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    wordcount = 0
    @entries.each do |entry|
      wordcount += entry.count_words
    end
    wordcount
  end

  def reading_time(wpm)
    time = 0
    @entries.each { |entry| time += entry.reading_time(wpm) }
    "It will take #{time} minute(s) to read this"
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    number_to_read = wpm * minutes
    sorted_array = @entries.sort_by { |entry| entry.count_words }
    sorted_array.select { |entry| entry.count_words <= number_to_read }[-1].contents
  end
end
