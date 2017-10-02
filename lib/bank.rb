class Bank
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def receive_transaction(transaction)
    @transactions << transaction
  end

  def calc_balance
    return 0 if @transactions == []
  end

end
