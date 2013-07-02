class Invoice < ActiveRecord::Base
  attr_accessible :amount, :customer_id, :expiredate, :status, :invoicetype
  
  belongs_to :customer
  
  validates_presence_of :amount, :customer_id, :invoicetype
  validates_numericality_of :amount
  
  INVOICE_TYPES = ["Invoice", "Quote"]
  INVOICE_STATUS = ["New", "Paid", "Unpaid"]
end
