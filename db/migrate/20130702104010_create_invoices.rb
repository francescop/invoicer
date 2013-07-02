class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :type
      t.string :status
      t.date :expiredate
      t.integer :customer_id
      t.float :amount

      t.timestamps
    end
  end
end
