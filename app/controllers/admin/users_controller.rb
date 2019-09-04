class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    end
    def show
      @user = User.find(params[:id])
    end
    def edit
      @user = User.find(params[:id])
    end
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:notice] ="You have updated user successfully."
         redirect_to admin_user_path
        else
         render "edit"
        end
    end
   def destroy
    user = User.find(params[:id])
    user.is_deleted = true
    user.save
    redirect_to admin_users_path
   end
    private
    def user_params
      params.require(:user).permit(:first_name, :last_name,:email,:first_name,:first_name_kana,:last_name_kana,:last_name,:address_id,:is_deleted,:telephone_number,:post_number,:address)
    end
end