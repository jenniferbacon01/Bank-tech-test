class Bank
  attr_reader :transactions, :balance, :statement

  def initialize
    @transactions = []
    @statement = ''
    @balance = 0
  end

  def receive_transaction(transaction)
    @transactions << transaction
  end

  def print_statement(transactions = @transactions)
    transactions.each { |transaction| update_statement(transaction) }
    add_titles_to_statement
    @statement
  end

  private

  def update_statement(transaction)
    @balance += transaction.amount
    @statement.prepend(" || #{@balance}.00")
    add_amount_to_statement(transaction)
    @statement.prepend("\n#{transaction.date} || ")
  end

  def add_amount_to_statement(transaction)
    if transaction.credit_or_debit == :credit
      @statement.prepend("#{transaction.amount}.00 ||")
    else
      @statement.prepend("|| #{-transaction.amount}.00")
    end
  end

  def add_titles_to_statement
    @statement.prepend('date || credit || debit || balance')
  end
end
