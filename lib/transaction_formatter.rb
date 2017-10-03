class TransactionFormatter

  def format(date, amount, credit_or_debit)
    format_date(date) + format_amount(amount, credit_or_debit)
  end

  private

  def format_date(date)
    return "\n#{date} || "
  end

  def format_amount(amount, credit_or_debit)
    return "#{amount}.00 ||" if credit_or_debit == :credit
    return "|| #{-amount}.00" if credit_or_debit == :debit
  end

end
