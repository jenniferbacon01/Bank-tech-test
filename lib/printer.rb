class Printer

  def initialize(transactions)
    @transactions = transactions
    @statement = ""
    @balance = 0
  end

  def update_balance(transaction)
    @balance += transaction.amount
  end

  def print_statement(transactions = @transactions)
    transactions.each do |transaction|
      update_balance(transaction)
      statement_str.prepend(" || #{historic_balance}.00")
      statement_str.prepend("#{transaction.amount}.00 ||") if transaction.credit_or_debit == :credit
      statement_str.prepend("|| #{-transaction.amount}.00") if transaction.credit_or_debit == :debit
      statement_str.prepend("\n#{transaction.date} || ")
    end
    statement_str.prepend('date || credit || debit || balance')
    statement_str
  end

    # private
    #
    # # def
    #
    # def add_credit(amount)
    #   statement_str.prepend("#{amount}.00 ||")
    # end
    #
    # def add_debit(amount)
    #   statement_str.prepend("|| #{-amount}.00")
    # end
    #
    # def add_date(date)
    #   statement_str.prepend("\n#{date} || ")
    # end

end
