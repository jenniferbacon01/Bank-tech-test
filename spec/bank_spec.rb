require 'bank'

describe Bank do
  subject(:bank) { described_class.new }
  let(:trans_cr) { double :transaction }
  let(:statement) { double :statement }

  before do
    allow(trans_cr).to receive(:date).and_return('10/01/2012')
    allow(trans_cr).to receive(:calc_credit_or_debit).and_return(:credit)
    allow(trans_cr).to receive(:amount).and_return(1000)
    allow(statement).to receive(:print)
  end

  it 'receives a transaction and records it' do
    bank.receive(trans_cr)
    expect(bank.transactions).to eq [trans_cr]
  end

  it 'prints a statement' do
    expect(statement).to receive(:print)
    bank.print(statement)
  end

end
