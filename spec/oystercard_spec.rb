require 'oystercard'

describe Oystercard do
  subject (:oystercard) {described_class.new}
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
      expect{ oystercard.deduct(5) }.to change{ oystercard.balance }.from(10).to(5)
    end
  end

  describe '#touch in' do
    it 'allows the user to touch in' do
      oystercard.top_up(10)
      expect{oystercard.touch_in}.to change{oystercard.in_journey?}.from(false).to(true)
    end

    it 'Raise an error when do not of funds to travel' do
      p oystercard
      expect{oystercard.touch_in}.to raise_error 'Not enough funds for travel'
    end
  end

  describe '#touch out' do
    it 'allows the user to touch out' do
      oystercard.top_up(10)
      oystercard.touch_in
      expect{ oystercard.touch_out }.to change{ oystercard.in_journey? }.from(true).to(false)
    end
  end

  describe '#error' do

    it 'Raises an error when balance exceeds £90' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      oystercard.top_up(maximum_balance)
      expect{oystercard.top_up 1}.to raise_error "Sorry, you have exceeded the maximum balance (£#{maximum_balance})"
    end

    # it 'Raise an error when do not of funds to travel' do
    #   p oystercard
    #   expect(oystercard.touch_in).to raise_error 'Not enough funds for travel'
    # end
  end
end
