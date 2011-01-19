class AffiliatePayment < ActiveRecord::Base
  has_many :affiliate_earnings, :dependent => :destroy
  has_many :affiliate_credits, :dependent => :destroy
end
