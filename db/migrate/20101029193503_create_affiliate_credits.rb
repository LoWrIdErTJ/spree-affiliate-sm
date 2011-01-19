class CreateAffiliateCredits < ActiveRecord::Migration
  def self.up
    create_table :affiliate_credits do |t|
      t.integer :user_id
      t.string  :status
      t.string  :comment
      t.integer :affiliate_payment_id
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :affiliate_credits
  end
end
