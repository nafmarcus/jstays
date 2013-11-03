class AvailableDate < ActiveRecord::Base

belongs_to :property

 scope :first_available, -> { where("a_date >= ?", Date.today).order("a_date ASC").first }

end
