require 'transaction'

describe Transaction do

  let(:transaction_formatter) { double :transaction_formatter }
  describe 'credit' do
    subject(:transaction) { described_class.new('10-01-2012', 1000, transaction_formatter) }

    it 'records the date' do
      expect(transaction.date).to eq '10-01-2012'
    end

    it 'calculates if the transaction is a credit' do
      expect(transaction.calc_credit_or_debit).to eq :credit
    end

    it 'formats the transaction' do
      allow(transaction_formatter).to receive(:format).and_return('test')
      expect(transaction_formatter).to receive(:format).and_return('test')
      transaction.format
    end
  end

  describe 'debit' do
    subject(:transaction) { described_class.new('10-01-2012', -1000, transaction_formatter) }

    it 'calculates if the transaction is a debit' do
      expect(transaction.calc_credit_or_debit).to eq :debit
    end

  end
end
