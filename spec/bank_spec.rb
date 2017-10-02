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
end
