class OysterCard

  STARTING_BALANCE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  attr_accessor :balance, :touch_in, :in_journey, :touch_out

  def initialize(balance = STARTING_BALANCE, touch_in = false, in_journey = false, touch_out = false)
    @balance = balance
    @touch_in = touch_in
    @in_journey = in_journey
    @touch_out = touch_out
  end

  def top_up(amount)
    raise "Maximum balance exceeded!" if (amount + @balance) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    raise "Not enough money on card" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    @in_journey = false
  end

end
