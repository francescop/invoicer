class AddLocalAndCurrencyToUser < ActiveRecord::Migration
  def change
    add_column :users, :lang, :string, :default => 'en'
    add_column :users, :currency, :string, :default => '$'
  end
end
