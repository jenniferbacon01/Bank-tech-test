class Bank
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def receive_transaction(transaction)
    @transactions << transaction
  end

  def print_statement(printer = Printer.new(@transactions))
    printer.print_statement
  end


  # def print_statement
  #   statement_str = ''
  #   historic_balance = 0
  #   @transactions.each do |transaction|
  #     historic_balance += transaction.amount
  #     statement_str.prepend(" || #{historic_balance}.00")
  #     add_credit_to_statement_str(transaction.amount) if transaction.credit_or_debit == :credit
  #     add_debit_to_statement_str(transaction.amount) if transaction.credit_or_debit == :debit
  #     add_date_to_statement_str(transaction.date)
  #   end
  #   statement_str.prepend('date || credit || debit || balance')
  #   statement_str
  # end
  #
  # private
  #
  # def add_credit_to_statement_str(amount)
  #   statement_str.prepend("#{amount}.00 ||")
  # end
  #
  # def add_debit_to_statement_str(amount)
  #   statement_str.prepend("|| #{-amount}.00")
  # end
  #
  # def add_date_to_statement_str(date)
  #   statement_str.prepend("\n#{date} || ")
  # end

end
