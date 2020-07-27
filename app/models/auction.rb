class Auction < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bids
  validates_presence_of :title, :description, :start_date, :end_date
end
