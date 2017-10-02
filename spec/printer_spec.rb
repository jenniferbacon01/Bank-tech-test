require 'printer'

describe Printer do
  let(:transaction) { double :transaction }
  let(:transaction2) { double :transaction }
  subject(:printer) { described_class.new([transaction]) }
  subject(:printer2) { described_class.new([transaction, transaction2]) }

  it 'balance is initially zero' do
    expect(printer.balance).to eq 0
  end

  it 'statement string is initially empty' do
    expect(printer.statement_str).to eq ''
  end

  it 'can update the statement with one transaction' do
    allow(transaction).to receive(:date).and_return('10/01/2012')
    allow(transaction).to receive(:credit_or_debit).and_return(:credit)
    allow(transaction).to receive(:amount).and_return(1000)
    expect(printer.print_statement).to eq "date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00"
  end

  it 'can update the statement with 2 transactions' do
    allow(transaction).to receive(:date).and_return('10/01/2012')
    allow(transaction).to receive(:credit_or_debit).and_return(:credit)
    allow(transaction).to receive(:amount).and_return(1000)
    allow(transaction2).to receive(:date).and_return('13/01/2012')
    allow(transaction2).to receive(:credit_or_debit).and_return(:debit)
    allow(transaction2).to receive(:amount).and_return(-500)
    expect(printer2.print_statement).to eq "date || credit || debit || balance\n13/01/2012 || || 500.00 || 500.00\n10/01/2012 || 1000.00 || || 1000.00"
  end
end
