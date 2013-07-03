class RemoveTypeFromInvoicefield < ActiveRecord::Migration
  def up
	 remove_column :invoicefields, :type	
  end

  def down
  end
end
