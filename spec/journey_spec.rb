require 'journey'

describe Journey do

  it 'has an entry station' do
    journey = Journey.new("Old Street")
    expect(journey.entry_station).to eq "Old Street"
  end

  it 'the entry station is optional' do
    expect { Journey.new }.not_to raise_error
  end

  it 'has an exit station' do
    journey = Journey.new
    expect { journey.exit_station="Brixton" }.not_to raise_error
  end


end
