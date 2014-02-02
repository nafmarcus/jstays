json.array!(@available_dates) do |available_date|
  json.extract! available_date, 
  json.url available_date_url(available_date, format: :json)
end
