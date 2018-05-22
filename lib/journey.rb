class Journey
  attr_reader :entry_station
  attr_accessor :exit_station

  def initialize(entry_station = 0)
    @entry_station = entry_station
  end

end
