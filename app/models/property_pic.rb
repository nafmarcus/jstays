class PropertyPic < ActiveRecord::Base

belongs_to :property, :dependent => :destroy

has_attached_file :image, :path => ":rails_root/public/system/:class/:attachment/:style/:filename",
			:url => "/system/:class/:attachment/:style/:filename",
			:styles => { :w40 => "30x40>", :w80 => "60x80>", :w400 => "300x400>", :w480 => "360x480>"}, 
			:default_url => "anon_company_:style.jpg"
end
