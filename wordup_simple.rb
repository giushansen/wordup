require 'benchmark'

# We use a range to actually be able to run this script
RANGE_START = 1000
RANGE_END   = 2000

word_list = []
composed_words = []
elapsed_time = Benchmark.realtime do

  File.read('wordlist.txt').each_line do |line|
    stripped_line = line.strip
    next if stripped_line.empty?
    word = stripped_line.downcase
    word_list << word
  end
  six_letter_words = word_list[RANGE_START..RANGE_END].select { |word| word.length == 6 }

  six_letter_words.each do |six_letter_word|
    word_list[RANGE_START..RANGE_END].each do |start_word|
      word_list[RANGE_START..RANGE_END].each do |end_word|
        if six_letter_word == start_word + end_word
          composed_words << [six_letter_word, start_word, end_word]
        end
      end
    end
  end

end

composed_words.each do |result|
  puts "#{result[0]} = #{result[1]} + #{result[2]}"
end

puts "Combinations found: #{composed_words.size}"
puts "Elapsed time: #{elapsed_time}"
