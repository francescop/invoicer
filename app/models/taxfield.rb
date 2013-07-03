class Taxfield < ActiveRecord::Base
  belongs_to :setting
  attr_accessible :amount, :taxtype, :title
end
