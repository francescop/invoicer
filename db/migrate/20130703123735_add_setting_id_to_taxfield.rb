class AddSettingIdToTaxfield < ActiveRecord::Migration
  def change
    add_column :taxfields, :setting_id, :integer
  end
end
