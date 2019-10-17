class Admin::UsersController < ApplicationController
  before_action :authenticate_admin_manager!
	def index
    @users = User.with_discarded.page(params[:page])
  end
  def show
  	@user = User.with_discarded.find(params[:id])
  end
  def edit
  	@user = User.with_discarded.find(params[:id])
  end
  def update
    @user = User.with_discarded.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to admin_users_path
    else
      render "edit"
    end
  end
  def destroy
    @user = User.with_discarded.find(params[:id])
    @users = User.all
    @status = 0
    @users.each do |user|
      if user.id == @user.id
        @status = 1
      end
    end
    if @status == 1
      @user.discard
    else
      @user.undiscard
    end
    redirect_to admin_users_path
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :address, :post_number, :telephone_number, :is_deleted, :address_id)
  end
end
