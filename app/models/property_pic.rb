class PropertyPic < ActiveRecord::Base

belongs_to :property

has_attached_file :image, :path => ":rails_root/public/system/:class/:attachment/:style/:filename",
			:url => "/system/:class/:attachment/:style/:filename",
			:styles => { :h36 => "48x36#", :h42 => "56x42#", :h450 => "600x450#"},  #proportion is 4wx3h
			:default_url => "anon_company_:style.jpg"
end
