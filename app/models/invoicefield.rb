class Invoicefield < ActiveRecord::Base
  belongs_to :user
  belongs_to :invoice
  attr_accessible :amount, :invoice_id, :title, :fieldtype, :units, :rate
  
  validates_numericality_of :amount, :units, :rate
  
  FIELD_TYPES = ["fixed_amount", "percentage", "fixed_tax", "percentage_tax"]
end
