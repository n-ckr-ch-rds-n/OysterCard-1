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

  it 'knows whether or not it is complete' do
    journey = Journey.new
    journey.finish
    expect(journey).not_to be_complete
  end

  it 'the fare is the penalty fare if there is no entry station' do
    journey = Journey.new
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it 'the fare is the correct fare if there is an entry station and exit station' do
    journey = Journey.new("Walthamstow")
    journey.exit_station="Brixton"
    expect(journey.fare).to eq Journey::CORRECT_FARE
  end

end
