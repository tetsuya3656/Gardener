class Public::UsersController < ApplicationController
  before_action :reject_inactive_user, only: [:create]
  before_action :set_user, only: [:favorites]
  
  def index
    @users = User.all
    @users = @users.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end
  
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
  
  def favorites
    @favorite_post_images = PostImage.where(user_id: @user.id)
    @user = User.find_by(id: params[:id])
    
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :encrypted_password, :address, :is_deleted)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
