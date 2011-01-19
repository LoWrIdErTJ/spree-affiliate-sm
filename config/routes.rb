Rails.application.routes.draw do
  Rails.application.routes.draw do
    match '/:user_id' => "affiliates#index", :as => :affiliate_referral ,:user_id => /[0-9]+/
    match 'admin/affiliate_settings/show' =>  'admin/affiliate_settings#show', :as => :admin_affiliate_settings
    match 'admin/affiliate_settings/edit' =>  'admin/affiliate_settings#edit', :as => :admin_edit_affiliate_settings
    match 'admin/affiliate_settings/update' =>  'admin/affiliate_settings#update', :as => :admin_update_affiliate_settings
    match 'admin/affiliate_credits/update' =>  'admin/affiliate_credits#update', :as => :admin_update_affiliate_credits
    match 'affiliates/whats_this' =>  'affiliates#whats_this', :as => :whats_this
    match 'affiliates/show_details' =>  'affiliates#show_details', :as => :show_details
    match 'affiliates/request_payment' =>  'affiliates#request_payment', :as => :request_payment
    match 'affiliates/pay_user' =>  'affiliates#pay_user', :as => :pay_user
    namespace :admin do
      resources :user do
        resources :affiliate_credits
      end
    end
  end



end
