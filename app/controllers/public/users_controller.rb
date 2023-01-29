class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def unsubscribe
    @user = current_user
  end
  
  def withdraw
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end  
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :encrypted_password, :address, :is_deleted)
  end
end
