class AddOtherInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :website, :string
    add_column :users, :full_name, :string
    add_column :users, :phone, :string
  end

  def self.down
    remove_column :users, :website
    remove_column :users, :full_name
    remove_column :users, :phone
  end
end