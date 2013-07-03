class Setting < ActiveRecord::Base
  attr_accessible :companyname, :taxfields_attributes
  
  has_many :taxfields
  accepts_nested_attributes_for :taxfields, allow_destroy: true
end
