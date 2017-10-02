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

end
