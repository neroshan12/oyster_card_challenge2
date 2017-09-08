class Oystercard

  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    err_msg = "Sorry, you have exceeded the maximum balance (£#{MAXIMUM_BALANCE})"
    raise err_msg if @balance + value > MAXIMUM_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end
end
