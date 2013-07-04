class AddUserIdToInvoicefield < ActiveRecord::Migration
  def change
    add_column :invoicefields, :user_id, :integer
  end
end
