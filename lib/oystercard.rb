require_relative 'journey'

class OysterCard

  STARTING_BALANCE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90

  attr_accessor :balance
  attr_reader :entry_station, :exit_station, :journey_log, :journey

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
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

  def touch_out(exit_station = nil)
    @journey.exit_station=exit_station
    deduct(@journey.fare)
    log_journey
    @journey.finish
    @journey
  end

  private
  def deduct(fare)
    @balance -= fare
  end

  def log_journey
    @journey_log[@journey.entry_station] = exit_station
  end

end
