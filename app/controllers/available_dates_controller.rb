class AvailableDatesController < ApplicationController
  before_action :set_available_date, only: [:update, :destroy]

  def index
    @property = Property.find(params[:property_id])
    @available_dates = @property.available_dates
    @available_date = AvailableDate.new
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  # def show
  # end

  # def new
  #   @available_date = AvailableDate.new
  # end

  def create
    @available_date = AvailableDate.new(property_id: params[:property_id],
                                        a_date: params[:available_date][:date],
                                        level: :low)
    respond_to do |format|
      if @available_date.save
        format.html { redirect_to property_available_dates_path(@available_date.property)}
        format.json { render action: 'show', status: :created, location: @available_date }
      else
        format.html { redirect_to property_available_dates_path(@available_date.property)}
        format.json { render json: @available_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # def edit
  # end

  def update
    respond_to do |format|
      if @available_date.update(level: :high)
        format.html { redirect_to property_available_dates_path(@available_date.property)}
        format.json { head :no_content }
      else
        format.html { redirect_to property_available_dates_path(@available_date.property)}
        format.json { render json: @available_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property = @available_date.property
    @available_date.destroy
    respond_to do |format|
      format.html { redirect_to property_available_dates_path(@property) }
      format.json { head :no_content }
    end
  end

  private
    def set_available_date
      @available_date = AvailableDate.find(params[:id])
    end

    def available_date_params
      params[:available_date]
    end
end
