class AffiliateEarning < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  belongs_to :affiliate_payment
end