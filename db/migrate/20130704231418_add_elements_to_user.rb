class AddElementsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :postalcode, :string
    add_column :users, :vat, :string
  end
end
