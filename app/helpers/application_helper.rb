module ApplicationHelper
	  # Returns the full title on a per-page basis.
  def admin_user?
  	signed_in? and current_user.admin
  end
  def full_title(page_title)
    base_title = "Jstays"
    environ = Rails.env.development? ? ' -Development' : ''
    if page_title.empty?
      base_title + environ
    else
      "#{base_title} | #{page_title}"  + environ
    end
  end
  def sort_city_select(var)
    test_cities = var.each {|member| member.pop}
    test_cities = var.each {|member| member.pop}
    test_cities.sort! { |x,y| x <=> y}
  end
end
