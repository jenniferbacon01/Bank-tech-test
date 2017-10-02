require 'bank'

describe Bank do
  subject(:bank) { described_class.new }
  let(:trans_cr) { double :transaction }
  let(:trans_db) { double :transaction }

  before do
    allow(trans_cr).to receive(:date).and_return('10/01/2012')
    allow(trans_cr).to receive(:credit_or_debit).and_return(:credit)
    allow(trans_cr).to receive(:amount).and_return(1000)
    allow(trans_db).to receive(:date).and_return('13/01/2012')
    allow(trans_db).to receive(:credit_or_debit).and_return(:debit)
    allow(trans_db).to receive(:amount).and_return(-500)
  end

  it 'balance is initially zero' do
    expect(bank.balance).to eq 0
  end

  it 'statement string is initially empty' do
    expect(bank.statement).to eq ''
  end

  it 'receives a transaction and records it' do
    bank.receive_transaction(trans_cr)
    expect(bank.transactions).to eq [trans_cr]
  end

  it 'can print the statement with one transaction' do
    bank.receive_transaction(trans_cr)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n"\
    '10/01/2012 || 1000.00 || || 1000.00'
  end

  it 'can print the statement with 2 transactions' do
    bank.receive_transaction(trans_cr)
    bank.receive_transaction(trans_db)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n"\
    "13/01/2012 || || 500.00 || 500.00\n10/01/2012 || 1000.00 || || 1000.00"
  end
end
