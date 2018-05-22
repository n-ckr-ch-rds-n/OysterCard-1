require "oystercard"

describe OysterCard do
  subject(:card) { OysterCard.new }

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


  describe "#deduct" do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "it deducts the fare from the balace" do
      card.top_up(20)
      fare = 10
      expect {card.deduct(fare)}.to change{card.balance}.by -fare
    end
  end


  describe "#touch_in --> #in_journey --> #touch_out" do
    it "checks in it's #in_journey" do
      expect(card).not_to be_in_journey
    end

    it "#touch_in if it's not #in_journey" do
      card.touch_in
      expect(card).to be_in_journey
    end

    it "can #touch_out if it's not in journey" do
      card.touch_in
      card.touch_out
      expect(card).not_to be_in_journey
    end
  end
end
