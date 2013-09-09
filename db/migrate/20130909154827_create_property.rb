class CreateProperty < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.integer	:user_id

    	t.string 	:title
    	t.text		:description
    	t.string	:property_type
    	t.string	:sharing
    	t.string	:duration
    	t.string	:currency
    	t.float		:other_expenses
    	t.string	:location
    	t.text		:address
    	t.integer	:size
    	t.string	:size_units
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
