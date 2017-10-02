require 'transaction'

describe Transaction do

  describe 'credit' do

    subject(:transaction) { described_class.new('10-01-2012', 1000) }

    it 'records the date' do
      expect(transaction.date).to eq '10-01-2012'
    end

    it 'calculates if the transaction is a credit' do
      expect(transaction.credit_or_debit).to eq :credit
    end

  end

  describe 'debit' do

    subject(:transaction) { described_class.new('10-01-2012', -1000) }

    it 'calculates if the transaction is a debit' do
      expect(transaction.credit_or_debit).to eq :debit
    end
    
  end

end
