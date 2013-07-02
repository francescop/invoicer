class AddInvoicenumberToInvoce < ActiveRecord::Migration
  def change
    add_column :invoices, :invoicenumber, :integer
  end
end
