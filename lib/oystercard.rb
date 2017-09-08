class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise "Sorry, you have exceeded the maximum balance (£#{MAXIMUM_BALANCE})" if balance + value > 90
    @balance += value
  end
end
