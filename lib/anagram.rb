class String
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

  define_method(:main) do |test_string|
    ana_hash = Hash.new
    vowel = ["a", "e", "i", "o", "u", "y"]
    presence_user = []
    presence_test = []

    self + " "
    test_string + " "

    ana_hash.store("user format", self.downcase().delete(" "))
    ana_hash.store("test format", test_string.downcase().delete(" "))

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

    temp_test_chars.each() do |char|
      presence_test.push(vowel.include?(char))
    end

    ana_hash.store("test vowels", presence_test)

    user_vowel_array = ana_hash.fetch("user vowels")
    test_vowel_array = ana_hash.fetch("test vowels")

    if user_vowel_array.include?(true) == false || test_vowel_array.include?(true) == false
      "You need to input actual words!"
    elsif (ana_hash.fetch("user ana") == ana_hash.fetch("test ana")) && (ana_hash.fetch("palin test") == test_phrase)
      "These words are palindromes."
    elsif ana_hash.fetch("user ana") == ana_hash.fetch("test ana")
      "These words are anagrams."
    else
      "These words are palindromes."
    end
  end
end
