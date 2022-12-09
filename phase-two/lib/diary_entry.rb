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

entry = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet lectus a nibh mollis auctor id non est. Sed tempor venenatis tellus eget pellentesque. Nullam id diam et felis pulvinar condimentum quis fermentum ex. Quisque id diam nunc. Vivamus in malesuada nisl. Donec et arcu nisi. Phasellus consectetur ac enim at posuere. Nunc dignissim tempor justo, quis egestas massa egestas ac. Morbi porttitor lacus ut consectetur consequat. Nulla tincidunt, felis ut gravida blandit, ex nisl scelerisque lacus, eget facilisis erat ipsum in ligula. Mauris et enim id tortor fermentum commodo. Nunc vulputate sodales quam ac sodales. Phasellus ac diam eu felis tincidunt lacinia ut in dui. Proin ullamcorper metus sed enim volutpat, et lobortis purus dignissim. Cras eu nisl vitae ex dictum fermentum. Aenean auctor nibh eget bibendum lobortis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum faucibus ac justo id vulputate. Suspendisse rutrum sapien vel condimentum pretium. Curabitur a vulputate nunc. Curabitur eu nibh ante. Ut dignissim mi tempus, tincidunt augue id, semper leo. Duis auctor bibendum metus, vitae rhoncus elit tincidunt sed. In vel convallis ligula. Praesent tellus purus, pellentesque non imperdiet vitae, dignissim id nisl. Vivamus non urna at nisi consectetur condimentum. Sed.'
diary_entry = DiaryEntry.new('Peter Pan', entry)
p diary_entry.count_words
