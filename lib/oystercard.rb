class OysterCard

  STARTING_BALANCE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_accessor :balance, :touch_in, :in_journey, :touch_out
  attr_reader :entry_station, :exit_station, :journey_log

  def initialize(balance = STARTING_BALANCE, touch_in = false, touch_out = false)
    @balance = balance
    @touch_in = touch_in
    @touch_out = touch_out
    @journey_log = {}
  end

  def top_up(amount)
    raise "Maximum balance exceeded!" if (amount + @balance) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station = nil)
    raise "Not enough money on card" if @balance < MINIMUM_BALANCE
    @journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @journey.exit_station=exit_station
    @journey_log[@entry_station] = exit_station
    @entry_station = nil
  end

  def in_journey?
    @entry_station
  end


  private
  def deduct(fare)
    @balance -= fare
  end

end
