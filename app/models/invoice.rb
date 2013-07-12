class Invoice < ActiveRecord::Base
  attr_accessible :amount, :customer_id, :expiredate, :status, :invoicetype, :invoicenumber, :invoicefields_attributes
  
  belongs_to :customer
  
  has_many :invoicefields, :dependent => :destroy
  accepts_nested_attributes_for :invoicefields, allow_destroy: true
  
  validates_presence_of :customer_id, :invoicetype
  validates_numericality_of :amount, :allow_blank => true
  validates_numericality_of :invoicenumber, :if => :is_invoice?
  validates_uniqueness_of :invoicenumber, :if => :is_invoice?
  
  validates_presence_of :invoicenumber, :if => :is_invoice?
  
  before_validation :was_quote
  
  before_save :calculate_amount
  
  INVOICE_TYPES = ["Invoice", "Quote"]
  INVOICE_STATUS = ["New", "Paid", "Unpaid"]
  
  def translated_invoice_type
    I18n.t(invoice_type, :scope => :invoice_types)
  end
  
  def translated_invoice_statu
    I18n.t(invoice_statu, :scope => :invoice_status)
  end
  
  def is_invoice?
    invoicetype == "Invoice"
  end
  
  def was_quote
    if invoicetype_was == "Quote" && invoicetype == "Invoice" && invoicenumber == nil
      self.invoicenumber = Invoice.where(:invoicetype => "Invoice").last.invoicenumber += 1
    end
  end
  
  def calculate_amount
    temp = 0.0
    self.invoicefields.each do |field|
      if field.fieldtype == "fixed_amount" || field.fieldtype == "fixed_tax" 
        temp += field.amount      
      else 
        temp += 0
      end
    end
    
    self.invoicefields.each do |field|
      if field.fieldtype == "percentage" || field.fieldtype == "percentage_tax" 
        temp = temp * ( (field.amount / 100.0) + 1 )
      else
        temp += 0
      end
    end
    self.amount = temp.round(2)
  end
  
end
