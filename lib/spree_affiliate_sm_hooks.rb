class SpreeAffiliateSmHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_configurations_menu do
    "<%= configurations_menu_item(I18n.t('affiliate_settings'), admin_affiliate_settings_url, I18n.t('affiliate_desc')) %>"
  end

  insert_before :signup_below_password_fields do
    %(
      <% if 'new'!=params[:action] and 'create'!=params[:action] %>
          <p>
            <%= label(:user, :full_name, t("full_name"), :class => "title") %><br />
            <%= text_field(:user, :full_name, :class => "title")  %>
          </p>

          <p>
            <%= label(:user, :website, t("website"), :class => "title") %><br />
            <%= text_field(:user, :website, :class => "title")  %>
          </p>

          <p>
            <%= label(:user, :phone, t("phone"), :class => "title") %><br />
            <%= text_field(:user, :phone, :class => "title")  %>
          </p>
      <% end %>    
    )
  end
  replace :account_summary do
    %(
      <script type="text/javascript" language="javascript" charset="utf-8">
      // <![CDATA[
          $('head').append('<link rel="stylesheet" href="/stylesheets/affiliate_sm.css" type="text/css" />');
          $('h1').remove();
      // ]]>
      </script>

      <div id="user_profile">
          <div id="user_details">
            <h2 class="affiliate_link">
              <% if !@user.full_name.blank? %>
                <%= @user.full_name %>
              <% else %>
                <%= t('no_name') %>
              <% end %>
            </h2><%= link_to t('edit_profile'), edit_object_url %>
            <p class="info_items">
               <% if !@user.email.blank? %><a class="email" href="mailto:<%= @user.email %>"><%= @user.email %></a><br/><% end %>
               <% if !@user.website.blank? %><a class="web" href="<%= @user.website_url %>" target="_blank"><%= @user.website %></a><br/><% end %>
               <% if !@user.phone.blank? %><span class="phone"><%= @user.phone %></span><% end %>
            </p>
          </div>
          <% if !Spree::Config[:claimable_amount].blank? %>
            <div id="affiliate_details">
              <%  earnings = @user.affiliate_earnings.unpaid
                  total_earning = @user.total_earnings %>

              <h2 class="affiliate_link">Affiliate: <%= number_to_currency total_earning %></h2>
                <%= link_to t('whats_this'), :controller => "affiliates", :action => "whats_this" %>
              <p>
                <%= earnings.count %> <%= t('order_for')%> <%= number_to_currency @user.earnings_total %>
                <% if (total_earning !=0) %>
                  <%= link_to t('affiliate_earnings_details'), :controller => "affiliates", :action => "show_details", :id => @user %>
                <% end %>
                <br />
                <%= t("affiliate_url") %>:<br />
                <%= request.url.chomp(request.request_uri)%>/<%=@user.id %><br/>
                <% if (total_earning >= Spree::Config[:claimable_amount].to_f) %>
                  <%= link_to t('request_payment'), :controller => "affiliates", :action => "request_payment", :id => @user %>
                <% end %>
              </p>
            </div>
          <% end %>
      </div>
    )
  end
end