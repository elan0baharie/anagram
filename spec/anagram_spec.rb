require('rspec')
require('anagram')
require('pry')

describe('String#anagram_mthd') do
  it("will return a string in a uniform manner") do
    expect("d Ear   ".format_mthd()).to(eq("dear"))
  end

  it("will determine if the same letters are present in two example words") do
    expect(("dear").anagram_detect("read")).to(eq(true))
  end

  it("will determine if the same letters are present in two example words regardless of case") do
    expect(("Dear").anagram_detect("reAd")).to(eq(true))
  end

  it("will determine if the two strings when joined are spelled the same backwards and forwards") do
    expect(("bAt").palindrome_detect("Tab")).to(eq(true))
  end

  it("will determine if both strings contains vowels") do
    expect(("mrent").vowel?("teeth")).to(eq(true))
  end

  it("will determine if both string contain vowels") do
    expect(("mrnt").vowel?("tth")).to(eq(false))
  end

  it("will determine if either string lacks vowels") do
    expect(("ment").vowel?("tth")).to(eq(false))
  end

  it("will determine if either string shares any characters") do
    expect(("castle").antigram("why")).to(eq(false))
  end

  it("will determine if either string shares any characters") do
    expect(("castle").antigram("share")).to(eq(true))
  end

  it("will determine if the two string are anagrams") do
    expect(("parse").main("spare")).to(eq("These words are anagrams."))
  end

  it("will determine if the two string are anagrams regardless of case") do
    expect(("Parse").main("Spare")).to(eq("These words are anagrams."))
  end

  it("will determine if the two string are palindromes when taken together") do
    expect(("bat").main("tab")).to(eq("These words are palindromes."))
  end

  it("will determine if either of the two strings lack vowels") do
    expect(("brth").main("trhb")).to(eq("You need to input actual words!"))
  end

  it("will determine if either of the two strings lack vowels") do
    expect(("breath").main("trhb")).to(eq("You need to input actual words!"))
  end

  it("will determine if no letters match in the two strings") do
    expect(("breath").main("wound")).to(eq("These words have no letter matches and are antigrams."))
  end
end
