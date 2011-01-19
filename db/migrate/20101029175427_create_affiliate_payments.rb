class CreateAffiliatePayments < ActiveRecord::Migration
  def self.up
    create_table :affiliate_payments do |t|
      t.integer :user_id
      t.integer :affiliate_user_id
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :affiliate_payments
  end
end
