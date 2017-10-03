require 'transaction_formatter'

describe TransactionFormatter do

  subject(:transaction_formatter) { described_class.new }

  it 'formats a date and amount of a credit into a string' do
    expect(transaction_formatter.format("10-01-2012", 1000, :credit))
      .to eq "\n10-01-2012 || 1000.00 ||"
  end

end
