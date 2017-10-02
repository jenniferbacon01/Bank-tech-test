class Printer
  attr_reader :balance, :statement_str

  def initialize(transactions)
    @transactions = transactions
    @statement_str = ''
    @balance = 0
  end

  def print_statement(transactions = @transactions)
    transactions.each { |transaction| update_statement(transaction) }
    add_titles_to_statement
    statement_str
  end

  private

  def update_statement(transaction)
    update_balance(transaction)
    add_balance_to_statement
    add_amount_to_statement(transaction)
    add_date_to_statement(transaction)
  end

  def update_balance(transaction)
    @balance += transaction.amount
  end

  def add_balance_to_statement
    @statement_str.prepend(" || #{@balance}.00")
  end

  def add_amount_to_statement(transaction)
    @statement_str.prepend("#{transaction.amount}.00 ||") if transaction.credit_or_debit == :credit
    @statement_str.prepend("|| #{-transaction.amount}.00") if transaction.credit_or_debit == :debit
  end

  def add_date_to_statement(transaction)
    @statement_str.prepend("\n#{transaction.date} || ")
  end

  def add_titles_to_statement
    @statement_str.prepend('date || credit || debit || balance')
  end


end
