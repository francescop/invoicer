class CreateInvoicefields < ActiveRecord::Migration
  def change
    create_table :invoicefields do |t|
      t.string :type
      t.string :title
      t.float :amount
      t.integer :invoice_id

      t.timestamps
    end
  end
end
