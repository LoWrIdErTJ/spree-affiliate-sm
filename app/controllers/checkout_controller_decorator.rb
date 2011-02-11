CheckoutController.class_eval do
  private
  def process_affiliate_earning
    cookie = cookies[Spree::Config[:cookie_name]]
    if cookie && cookie.to_i != @order.user_id
      @order.affiliate_earning = AffiliateEarning.create
      affiliate = @order.affiliate_earning
      affiliate.order_id = @order.id
      affiliate.user_id = cookie
      affiliate.status = "created"
      affiliate.percentage = Spree::Config[:referal_incentive]
      affiliate.amount = (Spree::Config[:referal_incentive].to_d/100) * @order.total
      affiliate.save
    end
  end

  def completion_route
    process_affiliate_earning
    token_order_path(@order, @order.token)
  end
end