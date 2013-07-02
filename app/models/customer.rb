class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :fullname, :postalcode, :vat
  
  has_many :invoices
  
  validates_presence_of :fullname
  validates_uniqueness_of :fullname
  validates_uniqueness_of :vat, :allow_blank => true
end
