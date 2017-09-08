class Oystercard
  attr_reader :balance , :in_journey
  MAXIMUM_BALANCE = 90
  MIN_FEE = 1
  MINIMUM_FARE = 3

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    err_msg = "Sorry, you have exceeded the maximum balance (£#{MAXIMUM_BALANCE})"
    raise err_msg if @balance + value > MAXIMUM_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    err_msg = 'Not enough funds for travel'
    raise err_msg if @balance < MIN_FEE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_FARE)
  end
end
