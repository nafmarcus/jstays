class CreateProperty < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.integer	:user_id

    	t.string 	:title
    	t.text		:description
    	t.string	:property_type, :default => 'apartment'
    	t.string	:sharing, :default => 'exclusive'
    	t.string	:duration, :default => 'short_term'
    	t.string	:currency, :default => 'usd' #may not be used
    	t.float		:other_expenses
    	t.string	:location
    	t.text		:address
        t.float     :latitude
        t.float     :longitude
        t.float     :lat
        t.float     :long
    	t.string	:floor
    	t.float		:bedrooms
    	t.float		:bathrooms
    	t.integer	:sleeps
    	t.boolean	:kosher
    	t.text		:amenities
    	t.text		:comments1
    	t.text		:comments2
    	t.string	:video_link
    	t.boolean	:active

        t.float     :rate_long_term
        t.float     :rate_daily_regular
        t.float     :rate_daily_high
        t.float     :rate_weekly_regular
        t.float     :rate_weekly_high
        t.float     :rate_monthly_regular
        t.float     :rate_monthly_high

        t.boolean   :published
        t.date      :expires

    	t.timestamps
    end
  end
end
