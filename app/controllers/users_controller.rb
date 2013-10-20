class UsersController < ApplicationController
	 
	before_action :signed_in_user, :except => [:show, :new, :create]
	before_action :admin_user, :only => [:index, :destroy]
	before_action :self_or_admin, :only => [:edit, :update]

	def index
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)    # Not the final implementation!
		if @user.save
			sign_in @user
			flash[:success] = "Thanks for signing up!"
			redirect_to edit_user_path(@user)
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id]) 

		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
      redirect_to edit_user_path(@user)
		else
			render 'edit'
		end
	end
	def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, 
			:first_name, :last_name, :addt_emails, :currency, 
			:phone_day, :phone_eve, :phone_cell,
			:address, :city, :state, :zip, :country)
	end
end
