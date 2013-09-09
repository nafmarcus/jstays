class Property < ActiveRecord::Base
	
	has_many :property_pics
	has_many :available_dates

	validates :title, :property_type, :sharing, :duration, :currency, :location,
						:address, :bedrooms, :sleeps, :kosher, presence: true

	validate :rate_set

	def rate_set
		if rate_daily_regular.blank? && rate_daily_high.blank? && rate_weekly_regular.blank? &&
       rate_weekly_high.blank? && rate_monthly_regular.blank? && rate_monthly_high.blank?
    	errors.add(:rate_daily_regular, "Some rate must be included.")
    end
	end
end
