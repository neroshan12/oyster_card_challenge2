class Oystercard
  attr_reader :balance, :in_journey, :entry_station
  MAX_BALANCE = 90
  MIN_FEE = 1
  MIN_FARE = 3

  def initialize
    @balance = 0
    @in_journey = false

  end

  def top_up(value)
    err_msg = "Sorry, you have exceeded the maximum balance (£#{MAX_BALANCE})"
    raise err_msg if @balance + value > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    err_msg = 'Not enough funds for travel'
    raise err_msg if @balance < MIN_FEE
    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @in_journey = false
    deduct(MIN_FARE)
    @entry_station = nil
    @exit_station = exit_station
  end
end
