require 'benchmark'
require 'pry-byebug'
require_relative './lib/tree'

LETTERS_COUNT = 6

word_list = []
composed_words = []
elapsed_time = Benchmark.realtime do
  # Load and clean the words from the file
  File.read('wordlist.txt').each_line do |line|
    stripped_line = line.strip
    next if stripped_line.empty?
    word = stripped_line.downcase
    word_list << word
  end
  # Build the tree with this dictionary
  tree = Tree.new word_list
  # Start the search
  composed_words = tree.find_composed_words_of LETTERS_COUNT
end

composed_words.each do |result|
  puts "#{result[0]} = #{result[1]} + #{result[2]}"
end

puts "- Combinations found: #{composed_words.size}"
puts "- Elapsed time: #{elapsed_time}"
