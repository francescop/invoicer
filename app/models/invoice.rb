class Invoice < ActiveRecord::Base
  attr_accessible :amount, :customer_id, :expiredate, :status, :invoicetype, :invoicenumber, :invoicefields_attributes
  
  belongs_to :user
  belongs_to :customer
  
  has_many :invoicefields, :dependent => :destroy
  accepts_nested_attributes_for :invoicefields, allow_destroy: true
  
  validates_presence_of :customer_id, :invoicetype
  validates_numericality_of :amount, :allow_blank => true
  validates_numericality_of :invoicenumber, :if => :is_invoice?
  validates_uniqueness_of :invoicenumber
  
  validates_presence_of :invoicenumber, :if => :is_invoice?
  
  before_validation :was_quote
  
  before_save :calculate_amount
  
  INVOICE_TYPES = ["Invoice", "Quote"]
  INVOICE_STATUS = ["New", "Paid", "Unpaid"]
  
  def is_invoice?
    invoicetype == "Invoice"
  end
  
  def was_quote
    if invoicetype_was == "Quote" && invoicetype == "Invoice" && invoicenumber == nil
      self.invoicenumber = Invoice.where(:user_id => user_id, :invoicetype => "Invoice").last.invoicenumber += 1
    end
  end
  
  def calculate_amount
    temp = 0.0
    self.invoicefields.each do |field|
      case field.fieldtype
      when "fixed_amount" || "fixed_tax" then temp += field.amount
      when "percentage" || "percentage_tax" then temp = temp * ( (field.amount / 100.0) + 1 )
      else temp += 0
      end
    end
    self.amount = temp.round(2)
  end
  
end
