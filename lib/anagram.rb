class String
  #Test specs to demonstrate necessary functions
  define_method(:format_mthd) do
    self.downcase!().delete!(" ")
  end

  define_method(:anagram_detect) do |anagram_test|
    temp_hold = []
    user_string = self.downcase.delete(" ")
    test_string = anagram_test.downcase.delete(" ")

    temp_hold.push(test_string.split(""))
    temp_hold.unshift(user_string.split(""))

    temp_hold[0].sort!
    temp_hold[1].sort!
    temp_hold[0] == temp_hold[1]
  end

  define_method(:palindrome_detect) do |test_palin|
    test_phrase = self + test_palin
    palin_test = self + test_palin

    test_phrase.downcase!
    palin_test.downcase!
    palin_test.reverse!

    palin_test == test_phrase
  end

  define_method(:vowel?) do |test_word|
    temp_hold = []
    presence_user = []
    presence_test = []
    vowel = ["a", "e", "i", "o", "u", "y"]

    temp_hold.push(test_word.split(""))
    temp_hold.unshift(self.split(""))

    temp_hold[0].each() do |char|
       presence_user.push(vowel.include?(char))
    end

    temp_hold[1].each() do |char|
       presence_test.push(vowel.include?(char))
    end

    presence_user.include?(true) && presence_test.include?(true)
  end

  define_method(:antigram) do |test_word|
    temp_hold = []
    presence_test = []

    temp_hold.push(test_word.split(""))
    temp_hold.unshift(self.split(""))

    temp_hold[0].each() do |char|
       presence_test.push(temp_hold[1].include?(char))
    end
    presence_test.include?(true)
  end

#Main method to enact project requirements
  define_method(:main) do |test_string|
    ana_hash = Hash.new
    vowel = ["a", "e", "i", "o", "u", "y"]
    presence_user = []
    presence_test = []
    antigram_presence = []

    #Had to add white space to samples in order to run delete method from the beggining
    self + " ,"
    test_string + " ,"

    #Strings are saved in same case with all spaces removed
    ana_hash.store("user format", self.downcase().delete(" !,.?'@%$&:*;"))
    ana_hash.store("test format", test_string.downcase().delete(" !,.?'@%$&:*;"))

    temp_user = ana_hash.fetch("user format")
    temp_test = ana_hash.fetch("test format")
    ana_hash.store("user chars", temp_user.split(""))
    ana_hash.store("test chars", temp_test.split(""))

    temp_user_chars = ana_hash.fetch("user chars")
    temp_test_chars = ana_hash.fetch("test chars")

    test_phrase = temp_user + temp_test
    palin_test = temp_user + temp_test
    ana_hash.store("palin test", palin_test.reverse)

    ana_hash.store("user ana", temp_user_chars.sort)
    ana_hash.store("test ana", temp_test_chars.sort)

    temp_user_chars.each() do |char|
      presence_user.push(vowel.include?(char))
    end

    ana_hash.store("user vowels", presence_user)

    #Test for presence of vowels
    temp_test_chars.each() do |char|
      presence_test.push(vowel.include?(char))
    end

    ana_hash.store("test vowels", presence_test)

    user_vowel_array = ana_hash.fetch("user vowels")
    test_vowel_array = ana_hash.fetch("test vowels")

    #Test for presence of shared characters
    temp_user_chars.each() do |char|
      antigram_presence.push(temp_test_chars.include?(char))
    end

    total_shared_chars = Hash.new 0

    antigram_presence.each do |bool|
      total_shared_chars[bool] += 1
    end

    print total_shared_chars[true]

    if user_vowel_array.include?(true) == false || test_vowel_array.include?(true) == false
      "You need to input actual words!"
    elsif (ana_hash.fetch("user ana") == ana_hash.fetch("test ana")) && (ana_hash.fetch("palin test") == test_phrase)
      "These words are palindromes."
    elsif ana_hash.fetch("user ana") == ana_hash.fetch("test ana")
      "These words are anagrams."
    elsif antigram_presence.include?(true) == false
      "These words have no letter matches and are antigrams."
    else
      "These words are not antigram or anagrams because they share only #{ total_shared_chars[true] } characters."
    end
  end
end
