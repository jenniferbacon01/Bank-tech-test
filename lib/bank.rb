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
    statement_str = 'date || credit || debit || balance'
    historic_balance = 0
    @transactions.each do |transaction|
      if transaction.credit_amount > 0
        historic_balance += transaction.credit_amount
        statement_str += "\n#{transaction.date} || #{transaction.credit_amount}.00 || || #{historic_balance}.00"
      elsif transaction.debit_amount > 0
        historic_balance += transaction.debit_amount
        statement_str += "\n#{transaction.date} || || #{transaction.debit_amount} || #{historic_balance}.00"
      end
    end
    statement_str
  end
end
