require "oystercard"

describe OysterCard do
  subject(:card) { OysterCard.new }
  let(:station) {double :station}

  it "has a balance of zero" do
    expect(card.balance).to eq (0)
  end


  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "adds money to a card" do
      expect{ card.top_up(10) }.to change{ card.balance }.by 10
    end

    it "has a top up limit" do
      maximum_balance = OysterCard::MAXIMUM_BALANCE
      card.top_up(maximum_balance)
      expect { card.top_up(1)}.to raise_error "Maximum balance exceeded!"
    end
  end

  describe "#touch_in --> #in_journey --> #touch_out" do
    it "checks in it's #in_journey" do
      expect(card).not_to be_in_journey
    end

    it "#touch_in if it's not #in_journey" do

    end

    it "can #touch_out if it's not in journey" do
      card.top_up(OysterCard::MINIMUM_BALANCE)
      card.touch_in(station)
      card.touch_out
      expect(card).not_to be_in_journey
    end

    it "raises an error when the balance is below 1£" do
      expect{card.touch_in(station)}.to raise_error "Not enough money on card"
   end

    it "reduces the balance by the minimum fare when you #touch_out" do
      card.top_up(20)
      card.touch_in(station)
      expect{card.touch_out}.to change{card.balance}.by -OysterCard::MINIMUM_FARE
    end

    it "stores an entry station when you touch in" do
      card.top_up(20)
      card.touch_in(station)
      expect(card.entry_station).to eq station
    end












  end
end
