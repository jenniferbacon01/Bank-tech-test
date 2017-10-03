class Transaction
  attr_reader :date, :amount

  def initialize(date, amount, transaction_formatter = TransactionFormatter.new)
    @date = date
    @amount = amount
    @transaction_formatter = transaction_formatter
  end

  def calc_credit_or_debit
    return :credit if @amount > 0
    return :debit if @amount < 0
  end

  def format
    @transaction_formatter.format(@date, @amount, calc_credit_or_debit)
  end

end
