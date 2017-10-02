require 'transaction'

describe Transaction do
  describe 'credit' do
    subject(:transaction) { described_class.new('10-01-2012', 1000) }
    it 'records the date, credit and debit amounts when customer makes a deposit' do
      expect(transaction.date).to eq '10-01-2012'
      expect(transaction.credit_amount).to eq 1000
      expect(transaction.debit_amount).to eq 0
    end
  end
  describe 'debit' do
    subject(:transaction) { described_class.new('10-01-2012', -1000) }
    it 'records the date, credit and debit amounts when customer withdraws money' do
      expect(transaction.date).to eq '10-01-2012'
      expect(transaction.credit_amount).to eq 0
      expect(transaction.debit_amount).to eq 1000
    end
  end
end
