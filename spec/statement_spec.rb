require 'statement'

describe Statement do

  subject(:statement) { described_class.new }
  let(:trans_cr) { double :transaction }
  let(:trans_db) { double :transaction }

  before do
    allow(trans_cr).to receive(:create_trans_str).and_return("\n10/01/2012 || 1000.00 ||")
    allow(trans_cr).to receive(:amount).and_return(1000)
    allow(trans_db).to receive(:create_trans_str).and_return("\n13/01/2012 || || 500.00")
    allow(trans_db).to receive(:amount).and_return(-500)
  end

  it 'balance is initially zero' do
    expect(statement.balance).to eq 0
  end

  it 'contents is initially empty' do
    expect(statement.contents).to eq ''
  end

  it 'can print contents with one transaction' do
    expect(statement.print([trans_cr])).to eq "date || credit || debit || balance\n"\
    '10/01/2012 || 1000.00 || || 1000.00'
  end

  it 'can print contents with 2 transactions' do
    expect(statement.print([trans_cr, trans_db])).to eq "date || credit || debit || balance\n"\
    "13/01/2012 || || 500.00 || 500.00\n10/01/2012 || 1000.00 || || 1000.00"
  end

end
