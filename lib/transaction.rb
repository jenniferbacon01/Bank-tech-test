class Transaction
  attr_reader :date, :credit_amount, :debit_amount

  def initialize(date, amount)
    @date = date
    if amount > 0
      @credit_amount = amount
      @debit_amount = 0
    elsif amount < 0
      @credit_amount = 0
      @debit_amount = -amount
    end
  end
end
