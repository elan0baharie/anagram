require('rspec')
require('anagram')

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
  
end
