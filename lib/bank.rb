class Bank
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def receive_transaction(transaction)
    @transactions << transaction
  end

  def print_statement
    statement_str = ''
    historic_balance = 0
    @transactions.each do |transaction|
      historic_balance += transaction.amount
      if transaction.credit_or_debit == :credit
        statement_str.prepend("\n#{transaction.date} || #{transaction.amount}.00 || || #{historic_balance}.00")
      else
        statement_str.prepend("\n#{transaction.date} || || #{-transaction.amount}.00 || #{historic_balance}.00")
      end
    end
    statement_str.prepend('date || credit || debit || balance')
    statement_str
  end
end
