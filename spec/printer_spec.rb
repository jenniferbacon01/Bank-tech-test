require 'printer'

describe Printer do

  let(:transaction_cr) { double :transaction }
  let(:transaction_db) { double :transaction }
  subject(:printer) { described_class.new([transaction_cr]) }
  subject(:printer_multi) { described_class.new([transaction_cr, transaction_db]) }

  before do
    allow(transaction_cr).to receive(:date).and_return('10/01/2012')
    allow(transaction_cr).to receive(:credit_or_debit).and_return(:credit)
    allow(transaction_cr).to receive(:amount).and_return(1000)
    allow(transaction_db).to receive(:date).and_return('13/01/2012')
    allow(transaction_db).to receive(:credit_or_debit).and_return(:debit)
    allow(transaction_db).to receive(:amount).and_return(-500)
  end

  it 'balance is initially zero' do
    expect(printer.balance).to eq 0
  end

  it 'statement string is initially empty' do
    expect(printer.statement_str).to eq ''
  end

  it 'can update the statement with one transaction' do
    expect(printer.print_statement).to eq "date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00"
  end

  it 'can update the statement with 2 transactions' do
    expect(printer_multi.print_statement).to eq "date || credit || debit || balance\n13/01/2012 || || 500.00 || 500.00\n10/01/2012 || 1000.00 || || 1000.00"
  end
end
