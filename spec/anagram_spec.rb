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

  it("will determine if either string shares any characters") do
    expect(("parse").main("spare")).to(eq("These words are anagrams."))
  end
end
