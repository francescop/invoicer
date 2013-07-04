class RemoveCurrencyFromUser < ActiveRecord::Migration
  def up
	remove_column :users, :currency
  end

  def down
  end
end
