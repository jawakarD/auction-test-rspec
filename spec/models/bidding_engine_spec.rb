require 'rails_helper'

RSpec.describe BiddingEngine do
  describe ".bid!" do
    let(:seller) { User.create(:email => 'jane@doe.com', :password => 'pw1234') }
    let(:bidder) { User.create(:email => 'john@doe.com', :password => 'pw1234') }
    let(:auction) { 
      Auction.create(title: 'Anything', 
                                   description: 'Lorem ipsum', 
                                   start_date: DateTime.now, 
                                   end_date: DateTime.now + 1.week, 
                                   user_id: seller.id) 
    }

    it "create a new bid on an auction if bid is bigger than last bid on auction" do
      described_class.bid!(auction, 100, bidder)
      expect(auction.errors).to be_empty

      described_class.bid!(auction, 90, bidder)
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end

    it "cannot create a bid if its an equal amount as the last bid" do
      described_class.bid!(auction, 100, bidder)
      expect(auction.errors).to be_empty

      described_class.bid!(auction, 100, bidder)
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end
  end
end
