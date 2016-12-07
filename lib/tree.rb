require_relative 'node'

class Tree
  def initialize(words)
    @tree = Node.new
    @word_list = words.each { |word| @tree.insert word }
  end

  def find_composed_words_of(word_length)
    target_words = @word_list.select { |word| word.length == word_length }

    target_words.each_with_object([]) do |word, list|
      # Fetch the path in this fashion for the current word:
      # 'banned' gives [false, false, true, false, false, true]
      @tree.get_path(word).each_with_index do |word_exist, i|
        next unless word_exist
        if @tree.exist?(word[i + 1..-1])
          list << [word, word[0..i], word[i + 1..-1]]
        end
      end
    end
  end
end
