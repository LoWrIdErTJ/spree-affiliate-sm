## Summary

A simple affiliate tracking extension for Spree.  Provides the following functionality:

1. Generate a unique affiliate tracking URL for every user. 
2. Administrator's can set a cookie expiration period. 
3. Administrator's can set an affiliate commission percentage.
4. Administrator's can credit / debit a user's affiliate account balance. 
5. Registered users can view basic statistics about their affiliate performance. 

## Implementation

* Get public and migration files with:
    rake spree_affiliate_sm:install
* add the following line to in AppConfiguration:
    preference :cookie_name, :string, :default => 'app_referrerid'
* add to spree_configuration.rb
    Spree::Config.set :cookie_name => "app_referrerid"


## Credits

Copyright (c) 2011 [Sticker Mule](http://www.stickermule.com/), released under the New BSD License.
