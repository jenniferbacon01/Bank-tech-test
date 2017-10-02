require 'bank'

describe Bank do

  subject(:bank) { described_class.new }
  let(:transaction) { double :transaction }
  let(:printer) { double :printer }

  before do
    allow(printer).to receive(:print_statement)
  end

  it 'creates a transaction and records it' do
    bank.receive_transaction(transaction)
    expect(bank.transactions).to eq [transaction]
  end

  it 'prints a statement' do
    expect(printer).to receive(:print_statement)
    bank.print_statement(printer)
  end
end
