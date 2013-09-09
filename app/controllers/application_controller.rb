class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def signed_in_user
  	unless signed_in?
  		store_location
			redirect_to signin_url, notice: "Please sign in." 
		end
  end

  def self_or_admin
  	@user = User.find(params[:id])
    redirect_to(root_url) unless (current_user.id == @user.id || current_user.admin?)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
