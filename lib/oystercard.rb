class OysterCard

  STARTING_BALANCE = 0
  MAXIMUM_BALANCE = 90
  attr_accessor :balance

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    raise "Maximum balance exceeded!" if (amount + @balance) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

end
