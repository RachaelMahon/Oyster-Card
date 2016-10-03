

class Oystercard

  attr_reader :balance
  MAXIMUM_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance cannot exceed £#{MAXIMUM_LIMIT}." if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient funds!" if balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_FARE)
  end

private

  def deduct(amount)
    @balance -= amount
  end

end
