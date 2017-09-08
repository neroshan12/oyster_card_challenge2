require 'oystercard'

describe Oystercard do
  it 'initialized card will have a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'Top up balance' do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end
end
