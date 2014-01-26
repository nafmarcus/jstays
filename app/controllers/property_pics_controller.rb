class PropertyPicsController < ApplicationController

	before_action :set_property_pic, only: [:show, :edit, :update, :destroy]

  def index
    @property = Property.find(params[:property_id])
    @property_pic = PropertyPic.new
  end

  def create
    @property = Property.find(params[:property_id])
    params[:images].each do |_, upload_field|
      @property.property_pics << PropertyPic.create(image: upload_field)
    end

    redirect_to property_path(@property)
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
