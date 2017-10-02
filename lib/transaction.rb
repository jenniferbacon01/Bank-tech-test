class Transaction
  attr_reader :date, :credit_amount, :debit_amount

  def initialize(date, amount)
    @date = date
    @amount = amount
  end

  def credit?
    return true if @amount > 0
    return false if @amount <= 0
  end

  def debit?
    return true if @amount < 0
    return false if @amount >= 0
  end
end
