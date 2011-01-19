class AffiliateCredit < ActiveRecord::Base
  belongs_to :user
  belongs_to :affiliate_payment
end