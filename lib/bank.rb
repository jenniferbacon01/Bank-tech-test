class Bank
  attr_reader :transactions, :balance, :statement

  def initialize
    @transactions = []
  end

  def receive(transaction)
    @transactions << transaction
  end

  def print(statement = Statement.new)
    statement.print(@transactions)
  end

end
