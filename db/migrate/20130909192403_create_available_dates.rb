class CreateAvailableDates < ActiveRecord::Migration
  def change
    create_table :available_dates do |t|
    	t.references	:property
    	t.date 				:available_date
    	t.integer			:level
    end
    add_index :available_dates, :property_id
  end
end
