class AvailableDate < ActiveRecord::Base

belongs_to :property

 scope :first_available, -> { where("a_date >= ?", Date.today).order("a_date ASC").first }
 scope :in_month, ->(month, year) { where("MONTH(available_dates.a_date) = ? and YEAR(available_dates.a_date) = ?", month, year ) }
end
