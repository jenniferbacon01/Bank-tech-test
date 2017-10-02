class Transaction
  attr_reader :date, :amount

  def initialize(date, amount)
    @date = date
    @amount = amount
  end

  def calc_credit_or_debit
    return :credit if @amount > 0
    return :debit if @amount < 0
  end

  def create_trans_str
    create_date_str + create_amount_str
  end

  private

  def create_date_str
    return "\n#{@date} || "
  end

  def create_amount_str
    return "#{@amount}.00 ||" if calc_credit_or_debit == :credit
    return "|| #{-@amount}.00" if calc_credit_or_debit == :debit
  end

end
