class Bank
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def receive_transaction(transaction)
    @transactions << transaction
  end

  def calc_balance
    balance = 0
    @transactions.each do |transaction|
      balance += transaction.amount
    end
    balance
  end

  def print_statement
    statement_str = "date || amount || balance"
    historic_balance = 0
    @transactions.each do |transaction|
      historic_balance += transaction.amount
      statement_str += "\n#{transaction.date} || #{transaction.amount}.00 || #{historic_balance}.00"
    end
    statement_str
  end

end
