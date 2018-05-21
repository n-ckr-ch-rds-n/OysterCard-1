require "oystercard"

describe "User stories" do
#In order to use public transport
#As a customer
#I want money on my card
  it "allows the user to store money on the card" do
     card = OysterCard.new
     expect(card.balance).to eq 0
  end
end
