class PasswordResetsController < ApplicationController
	before_action :get_user,   		 only: [:edit, :update]
	before_action :valid_user, 		 only: [:edit, :update]
	before_action :check_expiration, only: [:edit, :update]
  def new
  end

  def create
  	@user = User.find_by(email: params[:password_reset][:email].downcase)
  	if @user
  		@user.create_reset_digest
  		@user.send_password_reset_email
  		flash[:info] = "Ban se nhan duoc email huong dan reset mat khau"
  		redirect_to root_url
  	else
  	flash.now[:danger] = "Xac nhan email khong hop le"
  	render 'new'
  	end 
  end

  def edit
  end

  def get_user
  	@user = User.find_by(email: params[:email])
  end

  def valid_user
  	unless (@user && @user.activated? &&
			@user.authenticated?(:reset, params[:id]))
  	redirect_to root_url
  end
end
	def check_expiration
		if @user.password_reset_expirated?
			flash[:danger] = "Mat khau da het han"
			redirect_to new_password_reset_url
	end
    end
	def update
		if params[:user][:password].empty?
			@user.errors.add(:password, "Mat khau khong de trong")
			render 'edit'
		elsif @user.update_attributes(user_params)
			log_in @user
			@user.update_attribute(:reset_digest, nil)
			flash[:success] = "Mat khau cap nhat thanh cong"
			redirect_to @user
		else
			render 'edit'
	end
  end
  private
  def user_params
  	params.require(:user).permit(:password, :password_confirmation)
  end
end
