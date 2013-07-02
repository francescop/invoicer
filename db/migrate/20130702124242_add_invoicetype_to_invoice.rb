class AddInvoicetypeToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :invoicetype, :string
  end
end
