class Invoice < ActiveRecord::Base
  attr_accessible :amount, :customer_id, :expiredate, :status, :invoicetype, :invoicenumber, :invoicefields_attributes
  
  belongs_to :customer
  
  has_many :invoicefields
  accepts_nested_attributes_for :invoicefields, allow_destroy: true
  
  validates_presence_of :amount, :customer_id, :invoicetype, :invoicenumber
  validates_numericality_of :amount
  validates_numericality_of :invoicenumber
  validates_uniqueness_of :invoicenumber
  
  INVOICE_TYPES = ["Invoice", "Quote"]
  INVOICE_STATUS = ["New", "Paid", "Unpaid"]
end
