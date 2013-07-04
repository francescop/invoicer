class AddUnitsAndRateToInvoicefield < ActiveRecord::Migration
  def change
    add_column :invoicefields, :units, :float
    add_column :invoicefields, :rate, :float
  end
end
