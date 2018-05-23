require "oystercard"

describe OysterCard do
  subject(:card) { OysterCard.new }

  it "has an initial balance of zero" do
    expect(card.balance).to eq (0)
  end

  it "has an empty journey log by default" do
    expect(card.journey_log).to eq ({})
  end

  describe "#top_up" do

    it "adds money to a card" do
      expect{ card.top_up(10) }.to change{ card.balance }.by 10
    end

    it "cards have a top up limit" do
      maximum_balance = OysterCard::MAXIMUM_BALANCE
      card.top_up(maximum_balance)
      expect { card.top_up(1)}.to raise_error "Maximum balance exceeded!"
    end
  end

  describe "#touch_in" do

    it "raises an error when the balance is below 1£" do
      expect{ card.touch_in }.to raise_error "Not enough money on card"
    end

  end
end
