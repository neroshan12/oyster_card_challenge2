require 'oystercard'

describe Oystercard do
  it 'initialized card will have a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'Top up balance' do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  describe '#error' do
  it 'Raises an error when balance exceeds £90' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{subject.top_up 1}.to raise_error "Sorry, you have exceeded the maximum balance (£#{maximum_balance})"
    end
  end
end
