require 'transaction'

describe Transaction do
  describe 'credit' do
    subject(:transaction) { described_class.new('10-01-2012', 1000) }

    it 'records the date' do
      expect(transaction.date).to eq '10-01-2012'
    end

    it 'calculates if the transaction is a credit' do
      expect(transaction.calc_credit_or_debit).to eq :credit
    end

    it 'creates a transaction string in the correct format' do
      expect(transaction.create_trans_str).to eq "\n10-01-2012 || 1000.00 ||"
    end
  end

  describe 'debit' do
    subject(:transaction) { described_class.new('10-01-2012', -1000) }

    it 'calculates if the transaction is a debit' do
      expect(transaction.calc_credit_or_debit).to eq :debit
    end

    it 'creates a transaction string in the correct format' do
      expect(transaction.create_trans_str).to eq "\n10-01-2012 || || 1000.00"
    end
  end
end
