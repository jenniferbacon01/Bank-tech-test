require 'transaction'

describe Transaction do

  it "records the date and amount when created" do
    subject(:transaction) { described_class.new("10-01-2012", 1000) }
    expect(transaction.date).to eq "10-01-2012"
    expect(transaction.amount).to eq 1000
  end
end
