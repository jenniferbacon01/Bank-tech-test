class Bank
  attr_reader :transactions, :balance, :statement_str

  def initialize
    @transactions = []
    @statement_str = ''
    @balance = 0
  end

  def receive_transaction(transaction)
    @transactions << transaction
  end

  def print_statement(transactions = @transactions)
    transactions.each { |transaction| update_statement(transaction) }
    add_titles_to_statement
    statement_str
  end

  private

  def update_statement(transaction)
    @balance += transaction.amount
    @statement_str.prepend(" || #{@balance}.00")
    add_amount_to_statement(transaction)
    @statement_str.prepend("\n#{transaction.date} || ")
  end

  def add_amount_to_statement(transaction)
    if transaction.credit_or_debit == :credit
      @statement_str.prepend("#{transaction.amount}.00 ||")
    else
      @statement_str.prepend("|| #{-transaction.amount}.00")
    end
  end

  def add_titles_to_statement
    @statement_str.prepend('date || credit || debit || balance')
  end
end
