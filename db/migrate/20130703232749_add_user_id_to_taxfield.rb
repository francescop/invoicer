class AddUserIdToTaxfield < ActiveRecord::Migration
  def change
    add_column :taxfields, :user_id, :integer
  end
end
