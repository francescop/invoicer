class Invoicefield < ActiveRecord::Base
  belongs_to :invoice
  attr_accessible :amount, :invoice_id, :title, :fieldtype
end
