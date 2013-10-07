class AvailableDate < ActiveRecord::Base

belongs_to :property, :dependent => :destroy

end
