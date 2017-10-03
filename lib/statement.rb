class Statement

  def print(transactions)
    balance = 0
    contents = transactions.map do |transaction|
      balance += transaction.amount
      create_trans_str_with_bal(transaction, balance)
    end.reverse.join
    create_title_str + contents
  end

  def create_trans_str_with_bal(transaction, balance)
    transaction.format + " || #{balance}.00"
  end

  private

  def create_title_str
    'date || credit || debit || balance'
  end

end
