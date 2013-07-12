class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :fullname, :postalcode, :vat, :phone, :email
  
  has_many :invoices, :dependent => :destroy
  
  validates_presence_of :fullname
  validates_uniqueness_of :fullname
  validates_uniqueness_of :vat, :allow_blank => true
  
  def quotes
    return Invoice.where(:customer_id => self.id, :invoicetype => "Quote").count
  end
  
  def open_invoices
    return Invoice.where(:customer_id => self.id, :invoicetype => "Invoice", :status => "New").count
  end
  
  def paid_invoices
    return Invoice.where(:customer_id => self.id, :invoicetype => "Invoice", :status => "Paid").count
  end
  
  def unpaid_invoices
    return Invoice.where(:customer_id => self.id, :invoicetype => "Invoice", :status => "Unpaid").count
  end
end
