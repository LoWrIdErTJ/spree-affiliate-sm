class Admin::AffiliateSettingsController < Admin::BaseController
  ssl_required

  def edit
    render :edit
  end

  def update
    if params[:preferences]['claimable_amount'].blank? || params[:preferences]['cookie_life_span'].blank? || params[:preferences]['referal_incentive'].blank? || params[:preferences]['affiliate_payment_request'].blank?
        flash[:error] = t("affiliate_setting_error")
        render :action => 'edit'
    else
      Spree::Config.set(params[:preferences])
      respond_to do |format|
        format.html {
          redirect_to admin_affiliate_settings_path
        }
      end
    end
  end
end

