class AddFieldtypeToInvoicefield < ActiveRecord::Migration
  def change
    add_column :invoicefields, :fieldtype, :string
  end
end
