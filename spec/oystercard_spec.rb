# require "oystercard"
#
# describe OysterCard do
#   subject(:card) { OysterCard.new }
#   let(:entry_station) {double :station}
#   let(:exit_station) {double :station}
#   let(:journey) { { entry_station => exit_station } }
#
#   it "has a balance of zero" do
#     expect(card.balance).to eq (0)
#   end
#
#
#   describe "#top_up" do
#     it { is_expected.to respond_to(:top_up).with(1).argument }
#
#     it "adds money to a card" do
#       expect{ card.top_up(10) }.to change{ card.balance }.by 10
#     end
#
#     it "has a top up limit" do
#       maximum_balance = OysterCard::MAXIMUM_BALANCE
#       card.top_up(maximum_balance)
#       expect { card.top_up(1)}.to raise_error "Maximum balance exceeded!"
#     end
#   end
#
#   describe "#touch_in --> #in_journey --> #touch_out" do
#     it "checks if it's #in_journey" do
#       expect(card).not_to be_in_journey
#     end
#
#     it "#touch_out ends a journey" do
#       card.top_up(OysterCard::MINIMUM_BALANCE)
#       card.touch_in(entry_station)
#       card.touch_out(exit_station)
#       expect(card).not_to be_in_journey
#     end
#
#     it "raises an error when the balance is below 1£" do
#       expect{card.touch_in(entry_station)}.to raise_error "Not enough money on card"
#    end
#
#     it "reduces the balance by the minimum fare when you #touch_out" do
#       card.top_up(20)
#       card.touch_in(entry_station)
#       expect{card.touch_out(exit_station)}.to change{card.balance}.by -OysterCard::MINIMUM_FARE
#     end
#
#     it "stores an entry station when you touch in" do
#       card.top_up(20)
#       card.touch_in(entry_station)
#       expect(card.entry_station).to eq entry_station
#     end
#
#     # it "stores the exit station" do
#     #   card.top_up(20)
#     #   card.touch_in(entry_station)
#     #   card.touch_out(exit_station)
#     #   expect(card.exit_station).to eq exit_station
#     # end
#
#     it "has an empty list of journeys by default" do
#       expect(card.journey_log).to eq ({})
#     end
#
#     it "touching in and out creates a journey" do
#      card.top_up(20)
#      card.touch_in(entry_station)
#      card.touch_out(exit_station)
#      expect(card.journey_log).to eq ({entry_station => exit_station})
#     end
#
#     it "stores a journey" do
#       card.top_up(20)
#       card.touch_in(entry_station)
#       card.touch_out(exit_station)
#       expect(card.journey_log).to include journey
#     end
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#   end
# end
