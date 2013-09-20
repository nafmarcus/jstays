class Property < ActiveRecord::Base
	
	belongs_to	:user
	has_many :property_pics
	has_many :available_dates

	validates :title, :property_type, :sharing, :duration, :location,
						:address, :bedrooms, :sleeps, presence: true

	validate :rate_set

	def rate_set
		if rate_daily_regular.blank? && rate_daily_high.blank? && rate_weekly_regular.blank? &&
       rate_weekly_high.blank? && rate_monthly_regular.blank? && rate_monthly_high.blank?
    	errors.add(:rate_daily_regular, "Some rate must be included.")
    end
	end

	def available_date(date_string)
		AvailableDate.where(property_id: self.id).where(:a_date => date_string.to_date).first
	end
end
