class String
  define_method(:format_mthd) do
    self.downcase().delete(" ")
  end

  define_method(:anagram_detect) do |anagram_test|
    vowels = ["a", "e", "i", "o", "u"]
    temp_hold = []
    length_of_test = anagram_test.length()
    user_string = self.downcase.delete(" ")
    test_string = anagram_test.downcase.delete(" ")

    temp_hold.push(test_string.split(""))
    temp_hold.unshift(user_string.split(""))
    puts temp_hold

    temp_hold[0].sort!
    temp_hold[1].sort!
    temp_hold[0] == temp_hold[1]


  end

  #   puts test_word_array
    # test_word_array = test_word.split(//)

    # possibilities = test_word_array
    #
    # possibilities.each() do |variation|
    #   wordlikes = variation.join()
    #   reference_array.push(wordlikes)
    # end
end
