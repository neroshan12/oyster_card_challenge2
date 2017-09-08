require 'oystercard'

describe Oystercard do
  it 'initialized card will have a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it 'Add amount' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
  end
  describe '#deduct' do
    it 'deduct amount from balance' do
      subject.top_up(10)
      expect(subject.deduct(5)).to eq 5
    end
  end

  context '#error' do
    it "Raises an error when balance exceeds #{Oystercard::MAXIMUM_BALANCE}" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      err_msg = "Sorry, you have exceeded the maximum balance (£#{maximum_balance})"
      expect { subject.top_up 1 }.to raise_error err_msg
    end
  end
end
