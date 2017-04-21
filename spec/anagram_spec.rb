require('rspec')
require('anagram')

describe('String#anagram') do
  it("will determine if the same letters are present in an example word") do
    expect(("dear").anagram_mthd("read")).to(eq("These words are anagrams."))
  end

  it("will determine if the same letters are present in an example word regardless of case") do
    expect(("dear").anagram_mthd("READ")).to(eq("These words are anagrams."))
  end

end
