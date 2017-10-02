require 'bank'

describe Bank do

  subject(:bank) { described_class.new }
  let(:transaction) { double :transaction }

  it 'has zero balance initially' do
    expect(bank.calc_balance).to eq 0
  end

  it 'creates a transaction and records it' do
    bank.receive_transaction(transaction)
    expect(bank.transactions).to eq [transaction]
  end

  it 'updates the balance after receiving a transaction' do
    allow(transaction).to receive(:amount).and_return(1000)
    bank.receive_transaction(transaction)
    expect(bank.calc_balance).to eq 1000
  end

  # it 'prints a statement after receiving a transaction' do
  #   allow(transaction).to receive(:date).and_return("10/01/2012")
  #   allow(transaction).to receive(:amount).and_return(1000)
  #   bank.receive_transaction(transaction)
  #   expect(bank.print_statement).to eq "date || credit || debit || balance\n"
  #   + "10/01/2012 || 1000.00 || || 1000.00"
  # end
end
