require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:entry_station) { double 'entry_station' }
  let(:exit_station) { double 'exit_station' }

  describe '#balance' do
    it 'initialized card will have a balance of 0' do
      expect(oystercard.balance).to eq(0)
    end
  end

  it 'initially the card is not in journey' do
    expect(oystercard.in_journey?).to eq(false)
  end
  describe '#top_up' do
    it 'Top up balance' do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end
  end

  describe '#deduct' do
    it 'deduct funds' do
      oystercard.top_up(10)
      expect { oystercard.deduct(5) }.to change { oystercard.balance }.from(10).to(5)
    end
  end

  describe '#touch in' do
    it 'allows the user to touch in' do
      oystercard.top_up(10)
      expect { oystercard.touch_in(entry_station) }.to change { oystercard.in_journey? }.from(false).to(true)
    end

    it 'Raise an error when do not of funds to travel' do
      err_msg = 'Not enough funds for travel'
      expect { oystercard.touch_in(entry_station) }.to raise_error err_msg
    end
  end

  describe '#touch out' do
    it 'allows the user to touch out' do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      expect { oystercard.touch_out(exit_station) }.to change { oystercard.in_journey? }.from(true).to(false)
    end
    it 'charges the user when they touch out' do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      min_fare = described_class::MIN_FARE
      expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by(-min_fare)
    end
  end

  describe '#error' do
    it "Raises an error when balance exceeds £#{Oystercard::MAX_BALANCE}" do
      max_balance = Oystercard::MAX_BALANCE
      oystercard.top_up(max_balance)
      expect { oystercard.top_up 1 }.to raise_error "Sorry, you have exceeded the maximum balance (£#{max_balance})"
    end
  end
end
