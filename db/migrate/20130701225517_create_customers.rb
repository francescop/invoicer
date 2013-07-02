class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :address
      t.string :postalcode
      t.string :city
      t.string :vat

      t.timestamps
    end
  end
end
