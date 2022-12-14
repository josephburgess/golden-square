class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts 'Hello. I will repeat a string many times.'
    @io.puts 'Please enter a string'
    string = @io.gets.chomp
    @io.puts 'Please enter a number of repeats'
    number = @io.gets
    @io.puts 'Here is your result:'
    @io.puts "#{string * number}"
  end
end
# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run
