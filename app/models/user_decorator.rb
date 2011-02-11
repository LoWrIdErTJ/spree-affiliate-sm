User.class_eval do
  attr_accessible :full_name, :website, :phone
  #validates :website, :url_format => true
  has_many :affiliate_earnings do
    def unpaid
      @unpaidEarnings ||= find(:all, {
        :select => "#{AffiliateEarning.table_name}.* ",
        :joins  => "JOIN #{Order.table_name} ON #{Order.table_name}.id = #{AffiliateEarning.table_name}.order_id ",
        :conditions => "#{Order.table_name}.state = 'complete' and #{AffiliateEarning.table_name}.status != 'paid'"
      })
    end
  end
  has_many :affiliate_credits do
    def unpaid
      @unpaidCredits ||= find(:all, :conditions => "status != 'paid'")
    end
  end
  def earnings_total
      @total_earnings||= self.affiliate_earnings.unpaid.sum(:amount)
  end
  def credits_total
      @total_credits ||= self.affiliate_credits.unpaid.sum(:amount)
  end
  def total_earnings
      self.earnings_total + self.credits_total
  end
  def website_url
    if website && !website.downcase.include?("http")
      "http://#{website}"
    else
      self.website
    end
  end
end
