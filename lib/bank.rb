class Bank

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def receive_transaction(transaction)
    @transactions << transaction
  end

end
