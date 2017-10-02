class Statement

  attr_reader :balance, :contents

  def initialize
    @balance = 0
    @contents = ''
  end

  def print(transactions)
    transactions.each { |transaction| update_contents(transaction) }
    add_titles_to_contents
    @contents
  end

  private

  def update_contents(transaction)
    @balance += transaction.amount
    @contents.prepend(" || #{@balance}.00")
    @contents.prepend(transaction.create_trans_str)
  end

  def add_titles_to_contents
    @contents.prepend('date || credit || debit || balance')
  end

end
