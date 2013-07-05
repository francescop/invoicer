# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :companyname, :lang, :phone, :address, :city, :postalcode, :vat

  
  # attr_accessible :title, :body
  
  has_many :invoices, :dependent => :destroy
  has_many :customers, :dependent => :destroy
  has_many :invoicefields, :dependent => :destroy
  
  validates_presence_of :companyname
  
  LANGS = [["en", :en], ["it",:it]]
end
