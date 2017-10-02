class Statement

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def print(transactions)
    contents = ""
    transactions.each { |transaction| contents.prepend(create_trans_str_with_bal(transaction)) }
    contents.prepend(create_title_str)
  end

  def create_trans_str_with_bal(transaction)
    @balance += transaction.amount
    transaction.create_trans_str + " || #{@balance}.00"
  end

  private

  def create_title_str
    'date || credit || debit || balance'
  end

end
