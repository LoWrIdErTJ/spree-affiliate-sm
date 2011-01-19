class CreateAffiliateEarnings < ActiveRecord::Migration
  def self.up
    create_table :affiliate_earnings do |t|
      t.integer :order_id
      t.integer :user_id
      t.string  :status
      t.integer :affiliate_payment_id
      t.decimal :amount, :precision => 8, :scale => 2
      t.decimal :percentage

      t.timestamps
    end
  end

  def self.down
    drop_table :affiliate_earnings
  end
end
