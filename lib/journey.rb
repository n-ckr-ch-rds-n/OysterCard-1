require_relative 'oystercard'

class Journey
  attr_reader :entry_station
  attr_accessor :exit_station
  PENALTY_FARE = 6
  CORRECT_FARE = 3

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
    @in_journey = true
  end

  def finish
    @in_journey = false
  end

  def fare
    return PENALTY_FARE if @entry_station == nil || @exit_station == nil
    return CORRECT_FARE
  end

  def complete?
    @in_journey
  end

end
