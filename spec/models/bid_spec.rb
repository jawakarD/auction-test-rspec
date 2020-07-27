# spec/models/bid_spec.rb 

require 'rails_helper'

RSpec.describe Bid, :type => :model do
  describe "Associations" do
    it { should belong_to(:bidder) }
    it { should belong_to(:auction) }
  end

  describe "Validations" do
    it { should validate_presence_of(:bidder) }
  end
end
