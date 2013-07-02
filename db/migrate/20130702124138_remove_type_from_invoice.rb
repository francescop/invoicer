class RemoveTypeFromInvoice < ActiveRecord::Migration
  def up
	remove_column :invoices, :type
  end

  def down
  end
end
