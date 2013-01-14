class Unscramble
  DICT_PATH = '/usr/share/dict/words'

  # Initialize instance variables for each beginning letter in the dictionary
  # Splitting the array by letter is a lookup optimization
  def initialize(dictionary=DICT_PATH)
    a_through_z = ('a'..'z').to_a
    a_through_z.each {|x| instance_variable_set(:"@dict_#{x}", [])}
    File.open(dictionary).each do |line|
      line.downcase!
      next unless line[/^[a-z]+$/]
      instance_variable_get(:"@dict_#{line[0]}").push(line.chomp)
    end
  end

  # Given a sequence of characters (without spaces), return the anagrams for that word
  # Example: unscramble.word("nmaeci") # => ["cinema", "anemic"]
  def word(word)
    letters = word.split(//)
    permutations = letters.permutation.to_a.map(&:join)
    permutations.select { |word| real_word?(word) }
  end

  # Given a phrase comprised of characters and spaces, return the anagrams for that phrase
  # Example: unscramble.phrase("a okay") # => ["a okay", "ay oak", "oak ay", "okay a", "okay a", "oak ay", "a okay", "ay oak"]
  # Note that just because the given words contained in the phrase are valid words does not
  # guarantee that the phrase is a sensible phrase
  def phrase(phrase)
    letters = phrase.split(//)
    permutations = letters.permutation.to_a.map(&:join)
    permutations.select { |phrase| real_phrase?(phrase) }
  end

  # Return whether this is a real word
  def real_word?(word)
    !!instance_variable_get(:"@dict_#{word[0]}").detect { |dict| dict == word }
  end
  private :real_word?

  # Return whether this is a real phrase, meaning that every word contained
  # in the phrase is a real word
  def real_phrase?(phrase)
    !!phrase.split.each { |word| return unless real_word?(word) }
    true
  end
  private :real_phrase?
end
