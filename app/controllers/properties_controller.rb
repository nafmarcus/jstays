class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.amenities = params[:amenities].collect{|k, v| v}.join(",") if params[:amenities]
    if @property.save
      redirect_to @property, notice: 'Property was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: 'Property was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      allowed_params = [:title, :description, :property_type, :sharing, :duration,
                    :currency, :other_expenses, :location, :address, :size, :size_units, 
                    :floor, :bedrooms, :bathrooms, :sleeps, :kosher, :amenities, :comments1, :comments2,
                    :video_link, :active,
                    :rate_daily_regular, :rate_daily_high, :rate_weekly_regular,
                    :rate_weekly_high, :rate_monthly_regular, :rate_monthly_high]
      allowed_params.concat([:user_id, :published]) if current_user.admin?
      params[:property].permit(allowed_params)
    end
end
