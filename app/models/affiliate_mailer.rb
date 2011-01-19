class AffiliateMailer< ActionMailer::Base
  helper "spree/base"
  default_url_options[:host] = Spree::Config[:site_url]

  def request_payment(user)
    @subject    = 'Affiliate payment request.'
    @body       = {"user" => user}
    @recipients = Spree::Config[:affiliate_payment_request]
    @from       = user.email
    @sent_on    = Time.now
  end

end