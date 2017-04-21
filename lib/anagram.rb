class String
  define_method(:anagram_mthd) do |test_word|
    vowels = ["a", "e", "i", "o", "u"]
    reference_array = []
    prep_word = self.downcase()
    test_word.downcase!()
    test_word_array = test_word.split(//)

    possibilities = test_word_array.permutation()

    possibilities.each() do |variation|
      wordlikes = variation.join()
      reference_array.push(wordlikes)
    end

    if (reference_array.include?(prep_word))

      return "These words are anagrams."
    else
      return false
    end


  end
end
