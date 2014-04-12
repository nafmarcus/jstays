class SearchController < ApplicationController
  def search
    params[:duration] = "long_term" if params.keys.join('--').include?('long_term')
    params[:duration] = "short_term" if params.keys.join('--').include?('short_term')
    params[:sharing] = "shared" if params.keys.join('--').include?('shared')
    # Default 6 months from today
    @from_date = params['from_date'] ? Date.new(params['from_date']['year'].to_i, params['from_date']['month'].to_i, params['from_date']['day'].to_i) : Date.today
    @to_date = params['to_date'] ? Date.new(params['to_date']['year'].to_i, params['to_date']['month'].to_i, params['to_date']['day'].to_i) : Date.today + 12.month

    @from_date.to_s
    @to_date.to_s

    filter = {}
    filter[:sharing] = params[:sharing] if params[:sharing].present?
    filter[:bathrooms] = params[:bathrooms] if params[:bathrooms].present?
    filter[:bedrooms] = params[:bedrooms] if params[:bedrooms].present?
    filter[:sleeps] = params[:sleeps] if params[:sleeps].present?
    filter[:duration] = params[:duration] if params[:duration].present?
    filter[:city] = params[:city]
    filter[:active] = true
    #require 'pry'; binding.pry
    @properties = Property.where(filter).available_between(@from_date, @to_date)
    if params[:amenities]
      sql = params[:amenities].collect { |idx, amenity| "amenities like '%#{amenity}%'" }.join(' and ')
      @properties = @properties.where(sql)
    end
    params[:amenities] ||= {}
  end
end