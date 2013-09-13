class PropertyPicsController < ApplicationController

	before_action :set_property_pic, only: [:show, :edit, :update, :destroy]
  
  def index
    @property = Property.find(params[:property_id])
    @property_pic = PropertyPic.new
  end

  def create
    @property_pic = PropertyPic.new(property_params)
    @property = Property.find(params[:property_id])
    @property_pic.property = @property
    @property_pic.save
    redirect_to property_property_pics_path(@property)    
  end

  def destroy
  	@property = @property_pic.property
  	@property_pic.destroy
    redirect_to property_property_pics_path(@property)
  end

  private
  def set_property_pic
  	@property_pic = PropertyPic.find(params[:id])
  end
  def property_params
    params[:property_pic].permit([:image])
  end
end
