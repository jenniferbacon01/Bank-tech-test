class Transaction
  attr_reader :date, :amount

  def initialize(date, amount)
    @date = date
    @amount = amount
  end

  def credit_or_debit
    return :credit if @amount > 0
    return :debit if @amount < 0
  end
end
