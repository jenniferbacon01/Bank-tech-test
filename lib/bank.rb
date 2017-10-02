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
    return balance
  end

end
