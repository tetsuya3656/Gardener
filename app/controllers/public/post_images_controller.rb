class Public::PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path, notice:"画像が投稿されました。"
    else
      render :new
    end  
  end
   
  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end
  
  def update
    @postimage = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
     redirect_to post_image_path(@post_image.id), notice:"投稿内容を編集しました。"
    else
     render :edit
    end
  end
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to '/post_images'
  end
  
  private

  def post_image_params
    params.require(:post_image).permit(:user_id, :image, :caption)
  end
  
end
