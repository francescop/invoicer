class Invoicefield < ActiveRecord::Base
  belongs_to :invoice
  attr_accessible :amount, :invoice_id, :title, :fieldtype, :units, :rate
  
  validates_numericality_of :amount
  
  FIELD_TYPES = ["fixed_amount", "percentage", "fixed_tax", "percentage_tax"]
  
  def translated_field_type
    I18n.t(field_type, :scope => :field_types)
  end
end
